import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/status.dart';
import 'package:meter_activation/components/ui/text_widget.dart';

Container category(
    String someText, bool startProcess, Future future, bgColor, textColor) {
  return Container(
    height: 30,
    width: 200,
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        new SetStatus(
            process: someText,
            processStart: startProcess,
            view: "icon",
            future: future),
        Center(child: textWidget(someText, textColor)),
      ],
    ),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
