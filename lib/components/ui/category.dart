import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/status.dart';
import 'package:meter_activation/components/ui/text_widget.dart';

Container category(String process, bool processStart, Future future, bgColor,
    textColor, bool lastStepSuccess) {
  return Container(
    height: 30,
    width: 200,
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        setStatus("general", processStart, "icon", future),
        Center(child: textWidget(process, textColor)),
      ],
    ),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
