import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/status_icon.dart';

FutureBuilder setStatus(String process, bool processStart, String view,
    Future future, String action, bool reset) {
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
                if (processStart == true && action == "") {
                  return Text("Performing Meter Registration");
                } else {
                  return Text(error.toString());
                }
              }
              break;
            case "Action":
              {
                if (processStart == true && action == "") {
                  return Text("Meter Status Track");
                } else {
                  print("ACTIONTEST123123123123" + action);
                  print("processstart" + processStart.toString());
                  if (reset == false) {
                    return Text(
                        "An Error Occured. Please click Reset and try again.");
                  } else {
                    return Text("Performing action. Please wait.");
                  }
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
          print("PRINTING TEXT 123" + message.toString());
          print("ACTION " + action);
          switch (action) {
            case "production":
              {
                return Text(
                    "Production test has started. Please wait. \n This might take a while.");
              }
              break;
            case "rssi":
              {
                return Text("RSSI Check has started. Please wait.");
              }
              break;
            case "":
              {
                print("IN CASE NORxMAL");
                return Text(message.toString());
              }
          }
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
