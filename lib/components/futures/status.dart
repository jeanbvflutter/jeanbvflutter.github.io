import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/status_icon.dart';

FutureBuilder setStatus(
    String process, bool processStart, String view, Future future) {
  String status;
  String message;
  String icon;
  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      print("STATUS TRACK");
      try {
        print("process start" + processStart.toString());
        status = snapshot.data.status.toString();
        message = snapshot.data.message.toString();
        print("MESSAGE PRINTED " + message + status);
        switch (processStart) {
          case false:
            {
              message = "METER STATUS TRACKER";
            }
            break;
        }
      } on Exception catch (_) {} catch (error) {
        if (view == "icon") {
          icon = displayStatus("ERROR");
          return Image.asset(
            icon,
          );
        } else if (view == "text") {
          switch (process) {
            case "Registration":
              {
                if (processStart == true) {
                  return Text("Performing Meter Registration");
                }
              }
          }
          return Text("Meter Status Tracker");
        }
      }
      if (snapshot.hasData) {
        if (view == "icon") {
          icon = displayStatus(status);
          return Image.asset(
            icon,
          );
        } else if (view == "text") {
          print("PRINTING TEXT");
          return Text(message.toString());
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
