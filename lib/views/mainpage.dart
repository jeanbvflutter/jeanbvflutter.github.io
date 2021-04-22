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
  bool _startMeterDisconnection = false;

  String currentProcess;

  Future<MeterInfo> _futureMeterRegistrationInfo;
  Future<ProductionInfo> _futureProductionTestInfo;
  Future<UnRegisterMeterInfo> _futureUnregisterMeter;
  Future<MeterConnectionInfo> _futureMeterConnection;
  Future _futureEndpointInfo;
  // Future<ProductionInfo> _futureNewProductionInfo;
  Future<MeterHealthCheckInfo> _futureHealthCheckInfo;
  Future<RSSIInfo> _futureRSSICheckInfo;
  Future<MeterBreakerInfo> _futureMeterBreakerOnInfo;

  Future<MeterDisconnectionInfo> _futureMeterDisconnection;
  Future<MeterConnectionInfo> connectMeterFuture;

  meterConnectionWrapper(Function func) {
    connectMeter(_serialNumber.text).then((value) {
      if (value.status == 'OK') {
        _futureEndpointInfo = func(_serialNumber.text);
        _futureEndpointInfo.then((value) {
          if (value.status == 'OK') {
            print("Operation has successful");
          } else {
            print("Operation has failed");
          }
          disconnectMeter(_serialNumber.text);
          return;
        });
      }
    });
  }

  fetchInstallationInfoCallback() {
    print("reseting");
    setState(() {
      print("reseting");
      _changeAddress = false;
      _startRegistration = false;
      _startMeterConnection = false;
      _futureMeterConnection = null;
      _futureMeterRegistrationInfo = null;
      _futureMeterDisconnection = null;
      _futureEndpointInfo = null;
      _futureRSSICheckInfo = null;
      _futureProductionTestInfo = null;
      _futureInstallationInfo = fetchInstallationInfo(_serialNumber.text);
    });
  }

  healthCheckMeterCallback() {
    setState(() {
      _futureHealthCheckInfo = healthCheckMeter(_serialNumber.text);
    });
  }

  rssiCheckCallback() {
    setState(() {
      _futureRSSICheckInfo = RSSIcheck(_serialNumber.text);
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

  meterHealthCheckCallback() {
    print("HEALTH CHECK METER V1");
    _futureHealthCheckInfo = healthCheckMeter(_serialNumber.text);
    _futureEndpointInfo = _futureHealthCheckInfo;
  }

  connectMeterCallback() {
    print("CONNECTING METER");
    setState(() {
      _futureMeterConnection = connectMeter(_serialNumber.text);
    });
  }

  changeAddressCallback() {
    setState(() {
      _changeAddress = true;
    });
  }

  productionTestCallback() {
    setState(() {
      _futureProductionTestInfo = newProductionTest(_serialNumber.text);
      _futureEndpointInfo = _futureProductionTestInfo;
    });
  }

  rssiCallback() {
    setState(() {
      _futureRSSICheckInfo = RSSIcheck(_serialNumber.text);
      _futureEndpointInfo = _futureRSSICheckInfo;
    });
  }

  meterDisconnectionCallback() {
    setState(() {
      _futureMeterDisconnection = disconnectMeter(_serialNumber.text);
      _futureEndpointInfo = _futureMeterDisconnection;
    });
  }

  meterRegistrationCallback() {
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
  }

  meterConnectionCallback() {
    setState(() {
      currentProcess = "Meter Connection";
      _futureMeterConnection = connectMeter(_serialNumber.text);
      _startMeterConnection = true;
      _futureEndpointInfo = _futureMeterConnection;
    });
  }

  registerMeterCallback() {
    // print("REGISTERING METER");
    meterRegistrationCallback();
    _futureMeterRegistrationInfo.then((value) {
      if (value.status == 'OK') {
        sleep(Duration(seconds: 3));
        meterConnectionCallback();
        _futureMeterConnection.then((value) {
          if (value.status == 'OK') {
            rssiCallback();
            _futureRSSICheckInfo.then((value) {
              if (value.status == 'OK') {
                productionTestCallback();
                _futureProductionTestInfo.then((value) {
                  if (value.status == 'OK') {
                    meterDisconnectionCallback();
                    _futureMeterDisconnection.then((value) {
                      if (value.status == 'OK') {
                        meterHealthCheckCallback();
                      }
                    });
                  }
                });
              }
            });
          }
        });
      }
    }).catchError((e) {
      print("ERRORRRR");
    }).whenComplete(() => print("Done!"));
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
                futureInstallationInformation: _futureInstallationInfo,
                changeAddress: changeAddressCallback,
                street: _street,
                zipCode: _zipCode,
                zipCodeExt: _zipcodeExt,
                houseNumber: _houseNumber,
                changeAddressBool: _changeAddress,
                unregisterMeter: unregisterMeterCallback,
                meterRegistrationInfo: _futureMeterRegistrationInfo,
                meterConnectionInfo: _futureMeterConnection,
                currentProcess: currentProcess,
                endpointInfo: _futureEndpointInfo,
                processStart: _startRegistration,
                futureProductionTestInfo: _futureProductionTestInfo,
                futureHealthCheck: _futureHealthCheckInfo,
                futureMeterDisconnectionInfo: _futureMeterDisconnection,
                futureRssiCheck: _futureRSSICheckInfo,
                newProductionTest: () {
                  meterConnectionWrapper(newProductionTest);
                },
                breakerOn: () {
                  meterConnectionWrapper(meterBreakerOn);
                },
                breakerOff: () {
                  meterConnectionWrapper(meterBreakerOff);
                },
                RSSICheck: () {
                  meterConnectionWrapper(RSSIcheck);
                })
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
