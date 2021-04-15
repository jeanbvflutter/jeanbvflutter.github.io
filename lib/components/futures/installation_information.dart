import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/header_info.dart';
import 'package:meter_activation/components/ui/installation_information_card.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/enums.dart';

import 'meter_registration.dart';

class InstallationInformation extends StatefulWidget {
  Future futureInstallationInformation;
  Future meterRegistrationInfo;
  final Function() registerMeterCallback;
  final Function() getLocation;
  final Function() productionTestCallback;
  final Function() changeAddress;
  final Function() unregisterMeter;

  TextEditingController street;
  TextEditingController zipCode;
  TextEditingController zipCodeExt;
  TextEditingController houseNumber;
  String status;
  bool changeAddressBool;

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
      this.meterRegistrationInfo});

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
        } on Exception catch (_) {} catch (error) {
          return Text("EXCEPTION");
        }
        if (widget.status == 'Not Activated' ||
            widget.status == 'Unregistered' ||
            widget.changeAddressBool == true) {
          return Column(
            children: [
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
                  Container(
                      // margin: EdgeInsets.all(5),
                      child: Row(
                    children: [
                      CustomButton(
                        onPressed: widget.registerMeterCallback,
                        text: 'Register meter',
                        textStyle: buttonTextStyle,
                        minWidth: 150,
                        height: 50,
                      ),
                      // E0039004361627619
                      SizedBox(
                          width: 200,
                          height: 45,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 30,
                                  ),
                                  child: Center(
                                      child: meterRegistration("status",
                                          widget.meterRegistrationInfo))),
                            ),
                          )),
                    ],
                  )),
                ],
              ),
              // Align()
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Card(
              //         elevation: 3,
              //         shape: RoundedRectangleBorder(
              //             side: BorderSide(color: Colors.black26),
              //             borderRadius: BorderRadius.circular(5)),
              //         child: Container(
              //             constraints: BoxConstraints(
              //               maxHeight: 50,
              //               minWidth: 80,
              //             ),
              //             margin: EdgeInsets.all(10.0),
              //             child: meterRegistration(
              //                 "status", widget.meterRegistrationInfo))))
            ],
          );
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
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
