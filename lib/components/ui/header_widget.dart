import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/text_widget.dart';
import 'package:meter_activation/views/mainpage.dart';

Container headerWidget(String someText) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(bottom: 15),
    child: Center(child: textWidget(someText, Colors.white)),
    decoration: BoxDecoration(color: Colors.blueGrey),
  );
}
