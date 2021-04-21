import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/installation_information.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/header_widget.dart';
import 'package:meter_activation/entities/RSSI_check.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/entities/meter_connection.dart';
import 'package:meter_activation/entities/meter_disconnection.dart';
import 'package:meter_activation/entities/unregister_meter.dart';
import 'dart:async';
import '../entities/meter_healthcheck.dart';
import '../entities/meter_healthcheck.dart';
import '../entities/register_meter.dart';
import '../components/ui/textfield_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:meter_activation/enums.dart';
import 'package:meter_activation/entities/production_check.dart';
import 'package:meter_activation/entities/meter_healthcheck.dart';
import 'package:meter_activation/entities/meter_breaker_actions.dart';
import 'package:meter_activation/entities/meter_connection.dart';

// Statefulwidget is mutable. It can be drawn multiple times within its lifetime.
// They are widget that can change their state multiple times and can be redrawn on the screen any number of times while to app is in action.
// "State" means data. The date can be changed during the lifetime of the widget without rebuilding it.

// Since we want the dashboard to show a real-time representation of the different states of energize / core / reporting, we need a stateful widget.

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<InstallationInfo> _futureInstallationInfo;
  final TextEditingController _serialNumber = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _zipcodeExt = TextEditingController();
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _street = TextEditingController();

  bool _changeAddress = false;
  bool _startRegistration = false;
  bool _startMeterConnection = false;
  bool _registrationSuccesful = false;
  bool _startMeterDisonnection = false;

  String currentProcess;

  Future<MeterInfo> _futureMeterRegistrationInfo;
  Future<ProductionInfo> _futureProductionInfo;
  Future<UnRegisterMeterInfo> _futureUnregisterMeter;
  Future<MeterConnectionInfo> _futureMeterConnection;
  Future _futureEndpointInfo;
  Future<ProductionInfo> _futureNewProductionInfo;
  Future<MeterHealthCheckInfo> _futureMeterHealthCheckInfo;
  Future<RSSIInfo> _futureRSSICheckInfo;
  Future<MeterBreakerInfo> _futureMeterBreakerOnInfo;
  Future<MeterBreakerInfo> _futureMeterBreakerOffInfo;
  Future<MeterDisconnectionInfo> _futureMeterDisconnection;

  /// WRAP THE ACTION IN BETWEEN CONNECTION
  meterConnectionWrapper(Function func) {
    setState(() {
      Future executeFuture;
      var connectionCallback = connectMeter(_serialNumber.text);

      connectionCallback.then((value) {
        if (value.status == 'OK') {
          print('EEYY!');
          executeFuture = func(_serialNumber.text);
        } else {
          print("Can't connect");
          return;
        }

        executeFuture.then((value) {
          if (value.status == 'OK') {
            print('EEYY!2');
            var disconnectionCallback = connectMeter(_serialNumber.text);
            disconnectionCallback.then((value) {
              if (value.status == 'OK') {
                print('Completed!');
              } else {
                print("Can't disconnect!");
              }
            });
          } else {
            print('FAILED EXECUTION');
          }
        });
      });
    });
  }

  fetchInstallationInfoCallback() {
    setState(() {
      _futureInstallationInfo = fetchInstallationInfo(_serialNumber.text);
      _changeAddress = false;
      _startRegistration = false;
      _startMeterConnection = false;
      _futureMeterConnection = null;
      _futureMeterRegistrationInfo = null;
    });
  }

  randomFunction() {
    setState(() {
      _futureUnregisterMeter = unregisterMeter(_serialNumber.text);
    });
  }

  unregisterMeterCallback() {
    setState(() {
      _futureUnregisterMeter = unregisterMeter(_serialNumber.text);
    });
  }

  registrationSuccessfulCallback() {
    _registrationSuccesful = true;
  }

  connectMeterCallback() {
    print("CONNECTING METER");
    setState(() {
      _futureMeterConnection = connectMeter(_serialNumber.text);
      _startMeterConnection = true;
    });
  }
  // connectMeterCallback() {
  //   setState(() {
  //     _futureMeterConnection = connectMeter(_serialNumber.text);
  //     _startMeterConnection = true;
  //   });
  // }

  changeAddressCallback() {
    setState(() {
      _changeAddress = true;
    });
  }

  registerMeterCallback() {
    // print("REGISTERING METER");
    setState(() {
      currentProcess = "Registration";
      _startRegistration = true;
      _futureMeterRegistrationInfo = registerMeter(
          _serialNumber.text,
          null,
          int.parse(_zipCode.text),
          _zipcodeExt.text,
          int.parse(_houseNumber.text),
          _street.text);

      _futureEndpointInfo = _futureMeterRegistrationInfo;
    });
    _futureMeterRegistrationInfo.then((value) {
      if (value.message == 'Meter registered successfully.') {
        sleep(Duration(seconds: 3));
        setState(() {
          currentProcess = "Meter Connection";

          _futureMeterConnection = connectMeter(_serialNumber.text);
          _startMeterConnection = true;

          _futureEndpointInfo = _futureMeterConnection;
        });
        _futureMeterConnection.then((value) {
          if (value.message == 'Meter connected successfully') {
            setState(() {
              // _futureMeterConnection = connectMeter(_serialNumber.text);

              _futureMeterDisconnection = disconnectMeter(_serialNumber.text);
              _startMeterDisonnection = true;
            });
          } else {
            print("HMMM");
          }
        });
      } else {
        print("Can't connect");
        return;
      }
    }).catchError((e) {
      print("ERRORRRR");
    }).whenComplete(() => print("Done!"));
    _futureMeterConnection.then((value) {
      if (value.message == 'Meter connected successfully') {
        // sleep(Duration(seconds: 4));
        print("SUCCESSFULL YES567890");

        setState(() {
          _futureMeterConnection = connectMeter(_serialNumber.text);

          // _futureMeterDisconnection = disconnectMeter(_serialNumber.text);
          _startMeterDisonnection = true;
        });
      } else {
        print("HMMM");
      }
    });
  }

  productionTestCallback() {
    setState(() {
      _futureProductionInfo = productionTest(_serialNumber.text);
    });
  }

  newProductionTestCallback() {
    print(_serialNumber.text);
    _futureProductionInfo = meterConnectionWrapper(newProductionTest);
  }

  healthCheckCallback() {
    _futureMeterHealthCheckInfo = meterConnectionWrapper(healthCheckMeter);
  }

  breakerOnCallback() {
    _futureMeterBreakerOnInfo = meterConnectionWrapper(meterBreakerOn);
  }

  breakerOffCallback() {
    _futureMeterBreakerOffInfo = meterConnectionWrapper(meterBreakerOff);
  }

  RSSICheckCallback() {
    _futureRSSICheckInfo = meterConnectionWrapper(RSSIcheck);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Eleena Meter Activation")),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Center(child: headerWidget("Investigate installation")),
            Center(child: textFieldWidget(_serialNumber, "Serienummer")),
            Row(
              children: [
                CustomButton(
                  onPressed: scanBarcode,
                  text: 'Scan Barcode',
                  textStyle: buttonTextStyle,
                  minWidth: 150,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                  onPressed: fetchInstallationInfoCallback,
                  text: 'Investigate meter',
                  textStyle: buttonTextStyle,
                  minWidth: 150,
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: 20),
            new InstallationInformation(
              registerMeterCallback: registerMeterCallback,
              getLocation: getLocation,
              productionTestCallback: productionTestCallback,
              futureInstallationInformation: _futureInstallationInfo,
              changeAddress: changeAddressCallback,
              street: _street,
              zipCode: _zipCode,
              zipCodeExt: _zipcodeExt,
              houseNumber: _houseNumber,
              changeAddressBool: _changeAddress,
              unregisterMeter: unregisterMeterCallback,
              meterRegistrationInfo: _futureMeterRegistrationInfo,
              connectMeterCallback: connectMeterCallback,
              meterConnectionInfo: _futureMeterConnection,
              currentProcess: currentProcess,
              endpointInfo: _futureEndpointInfo,
              processStart: _startRegistration,
              startMeterConnection: _startMeterConnection,
              newProductionTest: newProductionTestCallback,
              healthCheck: healthCheckCallback,
              breakerOn: breakerOnCallback,
              breakerOff: breakerOffCallback,
              RSSICheck: RSSICheckCallback,
            )
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    try {
      final serialnumber = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this._serialNumber.text = serialnumber;
      });
    } on PlatformException {
      print('Failed to get platform version.');
    }
  }

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      this._houseNumber.text = first.featureName;
      this._street.text = first.thoroughfare;
      this._zipCode.text = first.postalCode.split(' ')[0];
      this._zipcodeExt.text = first.postalCode.split(' ')[1];
    });
  }
}
