import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/status_icon.dart';

FutureBuilder setStatus(Future future) {
  String status;
  String icon;
  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      print("STATUS TRACK");
      try {
        status = snapshot.data.status.toString();
      } on Exception catch (_) {} catch (error) {
        icon = displayStatus("ERROR");
        return Image.asset(
          icon,
        );
      }
      print("STATUS" + status);
      if (snapshot.hasData) {
        print("TEST1");
        icon = displayStatus(status);
        return Image.asset(
          icon,
        );
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
