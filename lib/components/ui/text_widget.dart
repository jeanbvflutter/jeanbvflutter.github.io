import 'package:flutter/material.dart';

Text textWidget(String someText, textColor) {
  return Text(
    someText,
    style: TextStyle(color: textColor),
    textAlign: TextAlign.center,
  );
}
