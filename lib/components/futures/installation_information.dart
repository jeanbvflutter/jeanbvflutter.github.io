import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/status.dart';
import 'package:meter_activation/components/ui/category.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/installation_information_card.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/enums.dart';

import 'meter_registration.dart';

class InstallationInformation extends StatefulWidget {
  Future futureInstallationInformation;
  Future meterRegistrationInfo;
  Future meterConnectionInfo;

  final Function() registerMeterCallback;
  final Function() getLocation;
  final Function() productionTestCallback;
  final Function() changeAddress;
  final Function() unregisterMeter;
  final Function() connectMeterCallback;
  final Function() newProductionTest;
  final Function() healthCheck;
  final Function() breakerOn;
  final Function() breakerOff;
  final Function() RSSICheck;

  TextEditingController street;
  TextEditingController zipCode;
  TextEditingController zipCodeExt;
  TextEditingController houseNumber;
  String status;
  bool changeAddressBool;
  bool startMeterConnection;
  bool registrationSuccesful;
  bool processStart;
  String currentProcess;
  Future endpointInfo;

  InstallationInformation(
      {this.registerMeterCallback,
      this.getLocation,
      this.productionTestCallback,
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
      this.connectMeterCallback,
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
      });

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
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Vul het adres in waarop je de meter wil registereren, of klik op 'Detecteer locatie'")),
            SizedBox(height: 5),
            CustomButton(
              onPressed: widget.getLocation,
              text: 'Detecteer locatie',
              textStyle: buttonTextStyle,
              minWidth: 150,
              height: 50,
            ),
            SizedBox(height: 10),
            registrationInfo(widget.street, widget.zipCode, widget.zipCodeExt,
                widget.houseNumber),
            Row(
              children: [
                CustomButton(
                  onPressed: widget.registerMeterCallback,
                  text: 'Register meter',
                  textStyle: buttonTextStyle,
                  minWidth: 150,
                  height: 50,
                ),
                // E0018003191683116
                // SizedBox(
                //   width: 200,
                //   height: 45,
                //   child: Container(
                //     margin: EdgeInsets.only(top: 10),
                //     child: Card(
                //       elevation: 1,
                //       shape: RoundedRectangleBorder(
                //           side: BorderSide(color: Colors.black26),
                //           borderRadius: BorderRadius.circular(5)),
                //       child: Container(
                //           // margin: EdgeInsets.all(5),
                //           constraints: BoxConstraints(
                //             maxHeight: 30,
                //           ),
                //           child: Center(
                //               child: meterRegistration(
                //                   "status", widget.meterRegistrationInfo))),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(children: [
                  // setStatus(widget.meterRegistrationInfo),
                  Container(
                      child: Row(
                    children: [
                      Card(
                        child: category(
                          "Registration",
                          widget.processStart,
                          widget.meterRegistrationInfo,
                          Colors.grey[200],
                          Colors.black,
                          false,
                        ),
                      )
                      // setStatus(widget.meterRegistrationInfo),
                      // Text("Meter Registration Status"),
                    ],
                  )),
                  Container(
                      child: Row(
                    children: [
                      Card(
                        child: category(
                          "Meter Connection",
                          widget.processStart,
                          widget.meterConnectionInfo,
                          Colors.grey[200],
                          Colors.black,
                          widget.registrationSuccesful,
                        ),
                      ),
                      // Card(
                      //   child: category(
                      //       "RSSI Check",
                      //       true,
                      //       widget.meterRegistrationInfo,
                      //       Colors.grey[200],
                      //       Colors.black),
                      // ),
                    ],
                  )),
                ]),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Card(
                      //   child: category(
                      //     "Meter Connection",
                      //     widget.processStart,
                      //     widget.meterConnectionInfo,
                      //     Colors.grey[200],
                      //     Colors.black,
                      //     widget.registrationSuccesful,
                      //   ),
                      // ),
                      // Card(
                      //   child: category(
                      //       "Meter Disconnection",
                      //       true,
                      //       widget.meterRegistrationInfo,
                      //       Colors.grey[200],
                      //       Colors.black),
                      // )
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
                                widget.endpointInfo)))),
              ),
            )
            // child: Container(
            //   // margin: EdgeInsets.all(5),
            //   constraints: BoxConstraints(
            //     maxHeight: 30,
            //   ),
            // child: Center(
            //     child: meterRegistration(
            //         "status", widget.meterRegistrationInfo)
            // ),
          ]);
        } else {
          return Column(
            children: [
              installationInformationCard(
                widget.futureInstallationInformation,
              ),
              Row(
                children: [
                  CustomButton(
                    onPressed: widget.productionTestCallback,
                    text: 'Production Test',
                    minWidth: 150,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    onPressed: widget.changeAddress,
                    text: 'Change address',
                    minWidth: 150,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    onPressed: widget.unregisterMeter,
                    text: 'Unregister meter',
                    minWidth: 150,
                    height: 50,
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // CustomButton(
                  //   onPressed: widget.newProductionTest,
                  //   text: 'New production test',
                  //   minWidth: 150,
                  //   height: 50,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // CustomButton(
                  //   onPressed: widget.RSSICheck,
                  //   text: 'RSSI check',
                  //   minWidth: 150,
                  //   height: 50,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // CustomButton(
                  //   onPressed: widget.healthCheck,
                  //   text: 'Health check',
                  //   minWidth: 150,
                  //   height: 50,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // CustomButton(
                  //   onPressed: widget.breakerOn,
                  //   text: 'Breaker on',
                  //   minWidth: 150,
                  //   height: 50,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // CustomButton(
                  //   onPressed: widget.breakerOff,
                  //   text: 'Breaker off',
                  //   minWidth: 150,
                  //   height: 50,
                  // )
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
