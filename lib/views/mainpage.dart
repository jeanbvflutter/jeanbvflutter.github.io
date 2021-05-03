import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/installation_information.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/header_widget.dart';
import 'package:meter_activation/entities/RSSI_check.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/entities/meter_commands.dart';
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
import 'dart:async';

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
  bool _hasBreaker = false;
  bool _startMeterDisconnection = false;
  String action = "";
  String currentProcess;
  bool active = true;
  bool reset = false;
  Color colorPrimary = Colors.green;

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
  Future<MeterCommandInfoInfo> _futureMeterCommand;

  meterConnectionWrapper(Function func, String actionInput) {
    setState(() {
      active = false;
      _futureEndpointInfo = null;
      print("action " + actionInput);
      action = actionInput;
      colorPrimary = Colors.grey;
    });
    Future.delayed(
        const Duration(seconds: 4),
        () => setState(() {
              _futureEndpointInfo = connectMeter(_serialNumber.text);
              _futureEndpointInfo.then((value) {
                if (value.actionStatus == true) {
                  setState(() {
                    action = "";
                    _futureEndpointInfo = func(_serialNumber.text);
                  });

                  _futureEndpointInfo.then((value) {
                    print("VALUE STATUS" + value.actionStatus.toString());
                    if (value.actionStatus == true) {
                      print("Operation has successful");
                    } else {
                      print("Operation has failed");
                    }
                    // setState(() {
                    _futureEndpointInfo = disconnectMeter(_serialNumber.text);

                    // });
                    setState(() {
                      print("ACITIVATING");
                      reset = false;
                      _futureEndpointInfo = null;
                      active = true;
                      colorPrimary = Colors.green;
                    });
                  });
                } else {
                  setState(() {
                    reset = false;
                    print("Operation has failed");
                    active = true;
                  });
                }
              }).catchError((e) {
                setState(() {
                  action = "error";
                });
              }).whenComplete(() => print("Done!"));
            }));
  }

  fetchInstallationInfoCallback() {
    print("reseting");
    setState(() {
      print("reseting");
      active = true;
      _changeAddress = false;
      _startRegistration = false;
      _startMeterConnection = false;
      _futureMeterConnection = null;
      _futureMeterRegistrationInfo = null;
      _futureMeterDisconnection = null;
      _futureEndpointInfo = null;
      _futureMeterCommand = null;
      _futureRSSICheckInfo = null;
      _futureProductionTestInfo = null;
      _futureHealthCheckInfo = null;
      _futureInstallationInfo = fetchInstallationInfo(_serialNumber.text);
      if (this._serialNumber.text.contains('000000')) {
        this._hasBreaker = true;
      } else {
        this._hasBreaker = false;
      }
    });
  }

  unregisterMeterCallback() {
    setState(() {
      _futureUnregisterMeter = unregisterMeter(_serialNumber.text);
      _futureEndpointInfo = _futureUnregisterMeter;
    });
  }

  registrationSuccessfulCallback() {
    _registrationSuccesful = true;
  }

  healthCheckMeterCallback() {
    setState(() {
      _futureHealthCheckInfo = healthCheckMeter(_serialNumber.text);
      _futureEndpointInfo = _futureHealthCheckInfo;
    });
  }

  meterCommandCallback() {
    setState(() {
      _futureMeterCommand = getMeterCommands(_serialNumber.text);
      _futureMeterCommand = _futureMeterCommand;

      _futureMeterCommand.then((value) {
        List<DataRow> rows = [];

        value.commands.forEach((command) {
          rows.add(DataRow(cells: [
            DataCell(
              Text(command.enteredAt ?? ''),
            ),
            DataCell(
              Text(command.type ?? ''),
            ),
            DataCell(
              Text(command.result ?? ''),
            ),
          ]));
        });

        var alert = AlertDialog(
          title: Text('Command List'),
          content: SingleChildScrollView(
            child: Center(
              child: Container(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Entered At'),
                    ),
                    DataColumn(
                      label: Text('Type'),
                    ),
                    DataColumn(
                      label: Text('Result'),
                    ),
                  ],
                  rows: rows,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('X'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      });
    });
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

  resetAll() {
    setState(() {
      reset = true;
    });
    Future.delayed(
        const Duration(seconds: 3),
        () => setState(() {
              reset = true;
              active = true;
              colorPrimary = Colors.green;
              action = "";
              _futureEndpointInfo = null;
              _changeAddress = false;
              _startRegistration = false;
              _startMeterConnection = false;
              _futureMeterConnection = null;
              _futureMeterRegistrationInfo = null;
              _futureMeterDisconnection = null;
              _futureEndpointInfo = null;
              _futureRSSICheckInfo = null;
              _futureProductionTestInfo = null;
              _futureHealthCheckInfo = null;
              meterDisconnectionCallback();
            }));
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
      active = false;
      colorPrimary = Colors.grey;
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

  cascadeActions() {
    Future.delayed(
        const Duration(seconds: 3),
        () => setState(() {
              print("setting state");
              currentProcess = "Meter Connection";
              _futureMeterConnection = connectMeter(_serialNumber.text);
              _startMeterConnection = true;
              _futureEndpointInfo = _futureMeterConnection;
              _futureMeterConnection.then((value) {
                if (value.actionStatus == true) {
                  print("IN HERE RSSI");
                  rssiCallback();
                  _futureRSSICheckInfo.then((value) {
                    if (value.actionStatus == true ||
                        value.actionStatus == false) {
                      productionTestCallback();
                      _futureProductionTestInfo.then((value) {
                        if (value.actionStatus == true ||
                            value.actionStatus == false) {
                          meterDisconnectionCallback();
                          _futureMeterDisconnection.then((value) {
                            if (value.actionStatus == true) {
                              setState(() {
                                active = true;
                                colorPrimary = Colors.green;
                              });
                            }
                          });
                        }
                      });
                    }
                  });
                } else {
                  print("in here else hmm");
                }
              });
            }));
  }

  registerMeterCallback() {
    print("REGISTERING METER");
    meterRegistrationCallback();
    _futureMeterRegistrationInfo.then((value) {
      if (value.status == 'OK') {
        cascadeActions();
      }
    }).catchError((e) {
      print(e);
      print("ERRORRRR");
    }).whenComplete(() => print("Done!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Eleena Meter Activation")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 500, maxWidth: 900),
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: textFieldWidget(_serialNumber, "Serienummer")),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: scanBarcode,
                        text: 'Scan Barcode',
                        textStyle: buttonTextStyle,
                        minWidth: 150,
                        height: 50,
                        active: active,
                        colorPrimary: colorPrimary,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: fetchInstallationInfoCallback,
                        text: 'Investigate meter',
                        textStyle: buttonTextStyle,
                        minWidth: 150,
                        height: 50,
                        active: active,
                        colorPrimary: colorPrimary,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: resetAll,
                        text: 'Reset',
                        textStyle: buttonTextStyle,
                        minWidth: 150,
                        active: true,
                        height: 50,
                        colorPrimary: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InstallationInformation(
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
                    startMeterConnection: _startMeterConnection,
                    hasBreaker: _hasBreaker,
                    futureProductionTestInfo: _futureProductionTestInfo,
                    futureHealthCheck: _futureHealthCheckInfo,
                    futureMeterDisconnectionInfo: _futureMeterDisconnection,
                    futureRssiCheck: _futureRSSICheckInfo,
                    action: action,
                    active: active,
                    healthCheckMeterCallback: healthCheckMeterCallback,
                    meterCommandCallback: meterCommandCallback,
                    colorPrimary: colorPrimary,
                    reset: reset,
                    newProductionTest: () {
                      meterConnectionWrapper(newProductionTest, "production");
                    },
                    breakerOn: () {
                      meterConnectionWrapper(meterBreakerOn, "breaker");
                    },
                    breakerOff: () {
                      meterConnectionWrapper(meterBreakerOff, "breaker");
                    },
                    RSSICheck: () {
                      meterConnectionWrapper(RSSIcheck, "rssi");
                    })
              ],
            ),
          ),
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