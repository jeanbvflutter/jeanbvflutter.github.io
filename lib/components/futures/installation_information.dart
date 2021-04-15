import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/custom_button.dart';
import 'package:meter_activation/components/ui/header_info.dart';
import 'package:meter_activation/components/ui/installation_information_card.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'package:meter_activation/enums.dart';

class InstallationInformation extends StatefulWidget {
  Future futureInstallationInformation;
  final Function() registerMeterCallback;
  final Function() getLocation;
  final Function() productionTestCallback;
  final Function() changeAddress;

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
      this.changeAddressBool});

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
            widget.status == 'Unregistered' || widget.changeAddressBool == true) {
          return Column(
            children: [
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
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    onPressed: widget.getLocation,
                    text: 'Geolocation',
                    textStyle: buttonTextStyle,
                    minWidth: 150,
                    height: 50,
                  ),
                ],
              ),
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
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
