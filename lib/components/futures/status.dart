import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/status_icon.dart';

FutureBuilder setStatus(String view, Future future) {
  String status;
  String icon;
  String message;
  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      print("STATUS TRACK");
      try {
        status = snapshot.data.status.toString();
        message = snapshot.data.message.toString();
      } on Exception catch (_) {} catch (error) {
        if (view == "icon") {
          icon = displayStatus("ERROR");
          return Image.asset(
            icon,
          );
        } else if (view == "text") {
          return Text("Meter Status Track");
        }
      }
      print("STATUS" + status);
      if (snapshot.hasData) {
        if (view == "icon") {
          icon = displayStatus(status);
          return Image.asset(
            icon,
          );
        } else if (view == "text") {
          return Text(message);
        }
      } else if (snapshot.hasError) {
        print("TEST2");
        return Text("NULL");
      }
      print("TEST3");
      // By default, show a loading spinner.
      return Text("NULL");
    },
  );
}
