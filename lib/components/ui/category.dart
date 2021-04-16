import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/status.dart';
import 'package:meter_activation/components/ui/text_widget.dart';

Container category(String someText, Future future, bgColor, textColor) {
  return Container(
    height: 30,
    width: 200,
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        setStatus("general", true, "icon", future),
        Center(child: textWidget(someText, textColor)),
      ],
    ),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
