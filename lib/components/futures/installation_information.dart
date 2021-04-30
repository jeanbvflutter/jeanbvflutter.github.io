import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/address_information.dart';
import 'package:meter_activation/components/futures/client_information.dart';
import 'package:meter_activation/components/futures/status.dart';
import 'package:meter_activation/components/ui/category.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/custom_information_card.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/enums.dart';

import 'meter_information.dart';

class InstallationInformation extends StatefulWidget {
  Future futureInstallationInformation;
  Future meterRegistrationInfo;
  Future meterConnectionInfo;
  Future futureHealthCheck;
  Future healthCheck;
  Future futureRssiCheck;
  Future meterDisconnectionInfo;
  Future futureProductionTestInfo;
  Future futureMeterDisconnectionInfo;

  final Function() registerMeterCallback;
  final Function() getLocation;
  final Function() changeAddress;
  final Function() unregisterMeter;
  final Function() newProductionTest;
  final Function() breakerOn;
  final Function() breakerOff;
  final Function() RSSICheck;
  final Function() healthCheckMeterCallback;
  final Function() meterCommandCallback;

  TextEditingController street;
  TextEditingController zipCode;
  TextEditingController zipCodeExt;
  TextEditingController houseNumber;
  String status;
  bool changeAddressBool;
  bool startMeterConnection;
  bool registrationSuccesful;
  bool processStart;
  bool hasBreaker;
  String currentProcess;
  Future endpointInfo;
  bool startMeterDisconnection;
  String action;
  bool active;
  Color colorPrimary;
  bool reset;

  InstallationInformation(
      {this.registerMeterCallback,
      this.getLocation,
      this.futureInstallationInformation,
      this.street,
      this.zipCode,
      this.zipCodeExt,
      this.houseNumber,
      this.status,
      this.changeAddress,
      this.changeAddressBool,
      this.unregisterMeter,
      this.meterRegistrationInfo,
      this.meterConnectionInfo,
      this.currentProcess,
      this.endpointInfo,
      this.processStart,
      this.startMeterConnection,
      this.newProductionTest,
      this.healthCheck,
      this.breakerOn,
      this.breakerOff,
      this.RSSICheck,
      this.hasBreaker,
      this.healthCheckMeterCallback,
      this.meterCommandCallback,
      this.futureHealthCheck,
      this.futureProductionTestInfo,
      this.startMeterDisconnection,
      this.futureRssiCheck,
      this.futureMeterDisconnectionInfo,
      this.action,
      this.active,
      this.colorPrimary,
      this.reset});

  @override
  _InstallationInformationState createState() =>
      _InstallationInformationState();
}

class _InstallationInformationState extends State<InstallationInformation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InstallationInfo>(
      future: widget.futureInstallationInformation,
      builder: (context, snapshot) {
        try {
          widget.status = snapshot.data.status.toString();
          print("REGISTRATION SUCCESSFUL" +
              widget.registrationSuccesful.toString());
        } on Exception catch (_) {} catch (error) {
          return Text("");
        }
        if (widget.status == 'Not Activated' ||
            widget.status == 'Unregistered' ||
            widget.changeAddressBool == true) {
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.0,
                  // alignment: Alignment.centerLeft,
                  child: CustomInformationCard(
                      headerInfoText: "Client Information",
                      information: widget.futureInstallationInformation,
                      futureBuilder: clientInformation,
                      buttonInfoList: [
                        ['ID: ', 'clientId'],
                        ['Achternaam: ', 'lastName'],
                        ['Voornaam: ', 'firstName'],
                        ['E-mail: ', 'email'],
                        ['Bron: ', 'clientSource'],
                      ]),
                ),
                SizedBox(
                  height: 150.0,
                  // alignment: Alignment.centerLeft,
                  child: CustomInformationCard(
                      headerInfoText: "Addres Information",
                      information: widget.futureInstallationInformation,
                      futureBuilder: addressInformation,
                      buttonInfoList: [
                        ['Postcode: ', 'zipCode'],
                        ['Extentie: ', 'zipCodeExt'],
                        ['Straat: ', 'street'],
                        ['Huisnummer: ', 'houseNumber'],
                        ['City: ', 'city'],
                      ]),
                ),
                SizedBox(
                  height: 150.0,
                  // alignment: Alignment.centerLeft,
                  child: CustomInformationCard(
                      headerInfoText: "Meter Information",
                      information: widget.futureInstallationInformation,
                      futureBuilder: meterInformation,
                      buttonInfoList: [
                        ['Serienummer: ', 'serialNumber'],
                        ['Status: ', 'status'],
                        ['Breaker status: ', 'breakerStatus'],
                        [null, null],
                        [null, null],
                      ]),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.all(15.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Align(
                        // alignment: Alignment.centerLeft,
                        child: Text(
                            "Vul het adres in waarop je de meter wil registereren")),
                    SizedBox(height: 10),
                    // CustomButton(
                    //   onPressed: widget.getLocation,
                    //   text: 'Detecteer locatie',
                    //   textStyle: buttonTextStyle,
                    //   minWidth: 150,
                    //   height: 50,
                    //   active: widget.active,
                    //   colorPrimary: widget.colorPrimary,
                    // ),
                    SizedBox(height: 10),
                    registrationInfo(widget.street, widget.zipCode,
                        widget.zipCodeExt, widget.houseNumber),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        CustomButton(
                          onPressed: widget.registerMeterCallback,
                          text: 'Register meter',
                          textStyle: buttonTextStyle,
                          minWidth: 150,
                          height: 50,
                          active: widget.active,
                          colorPrimary: widget.colorPrimary,
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Card(
                      child: category(
                          "Registration",
                          widget.processStart,
                          widget.meterRegistrationInfo,
                          Colors.grey[200],
                          Colors.black,
                          false,
                          widget.reset),
                    ),
                    Card(
                      child: category(
                          "Meter Connection",
                          widget.processStart,
                          widget.meterConnectionInfo,
                          Colors.grey[200],
                          Colors.black,
                          widget.registrationSuccesful,
                          widget.reset),
                    ),
                    // setStatus(widget.meterRegistrationInfo),
                    // Text("Meter Registration Status"),
                  ],
                ),
                Row(children: [
                  // setStatus(widget.meterRegistrationInfo),
                  Row(
                    children: [
                      Card(
                        child: category(
                            "RSSI Check",
                            widget.processStart,
                            widget.futureRssiCheck,
                            Colors.grey[200],
                            Colors.black,
                            true,
                            widget.reset),
                      ),
                      Card(
                        child: category(
                            "Meter Production Test",
                            widget.processStart,
                            widget.futureProductionTestInfo,
                            Colors.grey[200],
                            Colors.black,
                            true,
                            widget.reset),
                      ),
                      // setStatus(widget.meterRegistrationInfo),
                      // Text("Meter Registration Status"),
                    ],
                  ),
                ]),
                Row(children: [
                  // setStatus(widget.meterRegistrationInfo),
                  Row(
                    children: [
                      Card(
                        child: category(
                            "Meter Disconnection",
                            widget.processStart,
                            widget.futureMeterDisconnectionInfo,
                            Colors.grey[200],
                            Colors.black,
                            true,
                            widget.reset),
                      ),
                      Card(
                        child: category(
                            "Meter Health Check",
                            widget.processStart,
                            widget.futureHealthCheck,
                            Colors.grey[200],
                            Colors.black,
                            true,
                            widget.reset),
                      ),
                      // setStatus(widget.meterRegistrationInfo),
                      // Text("Meter Registration Status"),
                    ],
                  ),
                ]),
              ],
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                        // margin: EdgeInsets.all(5),
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 400,
                        ),
                        child: Center(
                            child: setStatus(
                                "Registration",
                                widget.processStart,
                                "text",
                                widget.endpointInfo,
                                "",
                                widget.reset)))),
              ),
            ),
          ]);
        } else {
          return Column(
            children: [
              Align(
                // alignment: Alignment.centerLeft,
                child: CustomInformationCard(
                    headerInfoText: "Client Information",
                    information: widget.futureInstallationInformation,
                    futureBuilder: clientInformation,
                    buttonInfoList: [
                      ['ID: ', 'clientId'],
                      ['Achternaam: ', 'lastName'],
                      ['Voornaam: ', 'firstName'],
                      ['E-mail: ', 'email'],
                      ['Bron: ', 'clientSource'],
                    ]),
              ),
              Align(
                // alignment: Alignment.centerLeft,
                child: CustomInformationCard(
                    headerInfoText: "Addres Information",
                    information: widget.futureInstallationInformation,
                    futureBuilder: addressInformation,
                    buttonInfoList: [
                      ['Postcode: ', 'zipCode'],
                      ['Extentie: ', 'zipCodeExt'],
                      ['Straat: ', 'street'],
                      ['Huisnummer: ', 'houseNumber'],
                      ['City: ', 'city'],
                    ]),
              ),
              Align(
                // alignment: Alignment.centerLeft,
                child: CustomInformationCard(
                    headerInfoText: "Meter Information",
                    information: widget.futureInstallationInformation,
                    futureBuilder: meterInformation,
                    buttonInfoList: [
                      ['Serienummer: ', 'serialNumber'],
                      ['Status: : ', 'status'],
                      ['Breaker status: ', 'breakerStatus'],
                    ]),
              ),
              Row(children: [
                Expanded(
                  child: CustomButton(
                    onPressed: widget.changeAddress,
                    text: 'Change address',
                    minWidth: 150,
                    height: 50,
                    active: widget.active,
                    colorPrimary: widget.colorPrimary,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: widget.unregisterMeter,
                    text: 'Unregister meter',
                    minWidth: 150,
                    height: 50,
                    active: widget.active,
                    colorPrimary: widget.colorPrimary,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: widget.newProductionTest,
                    text: 'New production test',
                    minWidth: 150,
                    height: 50,
                    active: widget.active,
                    colorPrimary: widget.colorPrimary,
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: widget.RSSICheck,
                      text: 'RSSI check',
                      minWidth: 150,
                      height: 50,
                      active: widget.active,
                      colorPrimary: widget.colorPrimary,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: widget.healthCheckMeterCallback,
                      text: 'Health check',
                      minWidth: 150,
                      height: 50,
                      active: widget.active,
                      colorPrimary: widget.colorPrimary,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: widget.meterCommandCallback,
                      text: 'Commands',
                      minWidth: 150,
                      height: 50,
                      active: widget.active,
                      colorPrimary: widget.colorPrimary,
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: widget.hasBreaker,
                      child: CustomButton(
                        onPressed: widget.breakerOn,
                        text: 'Breaker on',
                        minWidth: 150,
                        height: 50,
                        active: widget.active,
                        colorPrimary: widget.colorPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: widget.hasBreaker,
                      child: CustomButton(
                        onPressed: widget.breakerOff,
                        text: 'Breaker off',
                        minWidth: 150,
                        height: 50,
                        active: widget.active,
                        colorPrimary: widget.colorPrimary,
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            // margin: EdgeInsets.all(5),
                            constraints: BoxConstraints(
                              maxHeight: 50,
                            ),
                            child: Center(
                              child: setStatus(
                                  "Action",
                                  true,
                                  "text",
                                  widget.endpointInfo,
                                  widget.action,
                                  widget.reset),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
