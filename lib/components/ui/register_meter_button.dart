import 'package:flutter/material.dart';
import 'package:meter_activation/entities/register_meter.dart';

class RegisterMeterButton extends StatefulWidget {
  final Function() registerMeter;
  RegisterMeterButton({this.registerMeter});

  @override
  _RegisterMeterButtonState createState() => _RegisterMeterButtonState();
}

class _RegisterMeterButtonState extends State<RegisterMeterButton> {
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
            child: Text('Register meter',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.white)),
            onPressed: () {
              widget.registerMeter();
            },
          ),
        ),
      ),
    );
  }
}
