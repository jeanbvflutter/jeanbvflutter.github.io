import 'package:flutter/material.dart';
import 'package:meter_activation/entities/register_meter.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final double minWidth;
  final double height;
  final text;
  final textStyle;

  CustomButton({this.onPressed, this.minWidth, this.height, this.textStyle, this.text});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ButtonTheme(
          minWidth: widget.minWidth,
          height: widget.height,
          child: ElevatedButton(
            child: Text(widget.text,
                style: widget.textStyle),
            onPressed: () {
              widget.onPressed();
            },
          ),
        ),
      ),
    );
  }
}
