import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/status_icon.dart';

class SetStatus extends StatefulWidget {
  final String process;
  final bool processStart;
  final String view;
  final Future future;

  SetStatus({this.process, this.processStart, this.view, this.future});

  @override
  _SetStatusState createState() => _SetStatusState();
}

class _SetStatusState extends State<SetStatus> {
  @override
  Widget build(BuildContext context) {
    String status;
    String message;
    String icon;
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        print("STATUS TRACK");
        try {
          print(widget.processStart);
          status = snapshot.data.status.toString();
          message = snapshot.data.message.toString();
        } on Exception catch (_) {} catch (error) {
          if (widget.view == "icon") {
            icon = displayStatus("ERROR");
            return Image.asset(
              icon,
            );
          } else if (widget.view == "text") {
            switch (widget.process) {
              case "Registration Status":
                {
                  print("REGISTRATION TRACK STARTED: " +
                      widget.processStart.toString());
                  if (widget.processStart == true) {
                    return Text("Started Registration Process");
                  }
                }
                break;
            }
            return Text("Meter Status Track");
          }
        }
        print("STATUS" + status);
        if (snapshot.hasData) {
          if (widget.view == "icon") {
            icon = displayStatus(status);
            print("METER REGISTRATION SUCCESS:" + status);
            return Image.asset(
              icon,
            );
          } else if (widget.view == "text") {
            print("REGISTRATION TRACK" + widget.processStart.toString());
            // switch (process) {
            //   case "registration":
            //     {
            //       print("REGISTRATION TRACT CHECK2" + processStart.toString());
            //       if (processStart == true) {
            //         return Text("Started Registration Process");
            //       }
            //     }
            //     break;
            // }
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
}
