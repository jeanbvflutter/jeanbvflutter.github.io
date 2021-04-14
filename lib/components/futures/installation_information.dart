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

  TextEditingController street;
  TextEditingController zipCode;
  TextEditingController zipCodeExt;
  TextEditingController houseNumber;
  String status;
  InstallationInformation(
      {this.registerMeterCallback,
      this.getLocation,
      this.futureInstallationInformation,
      this.street,
      this.zipCode,
      this.zipCodeExt,
      this.houseNumber,
      this.status});

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
          return Text("");
        }
        if (widget.status == 'Not Activated' ||
            widget.status == 'Unregistered') {
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
                    width: 5,
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
              installationInformationCard(widget.futureInstallationInformation),
            ],
          );
        }
      },
    );
  }
}
