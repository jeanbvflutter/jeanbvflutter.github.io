import 'package:flutter/material.dart';
import 'package:meter_activation/entities/register_meter.dart';

class FetchInstallationInfoButton extends StatefulWidget {
  final Function() fetchInstallationInfo;
  FetchInstallationInfoButton({this.fetchInstallationInfo});

  @override
  _FetchInstallationInfoButtonState createState() => _FetchInstallationInfoButtonState();
}

class _FetchInstallationInfoButtonState extends State<FetchInstallationInfoButton> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: ElevatedButton(
            child: Text('Investigate meter',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.white)),
            onPressed: () {
              widget.fetchInstallationInfo();
            },
          ),
        ),
      ),
    );
  }
}
