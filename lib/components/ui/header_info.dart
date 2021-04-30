import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/text_widget.dart';
import 'package:meter_activation/views/mainpage.dart';

Container headerInfoWidget(String someText) {
  return Container(
    height: 30,
    width: 250,
    child: Center(child: textWidget(someText, Colors.white)),
    decoration: BoxDecoration(color: Colors.green),
  );
}
