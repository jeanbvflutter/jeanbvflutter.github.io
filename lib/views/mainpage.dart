import 'package:flutter/material.dart';
import 'dart:async';
import '../entities/register_meter.dart';
import '../components/textfield_ui.dart';
import 'package:flutter/services.dart';

// Statefulwidget is mutable. It can be drawn multiple times within its lifetime.
// They are widget that can change their state multiple times and can be redrawn on the screen any number of times while to app is in action.
// "State" means data. The date can be changed during the lifetime of the widget without rebuilding it.

// Since we want the dashboard to show a real-time representation of the different states of energize / core / reporting, we need a stateful widget.

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
  Future<MeterInfo> _futureMeterInfo;
}

Text textWidget(String someText, textColor) {
  return Text(
    someText,
    style: TextStyle(color: textColor),
    textAlign: TextAlign.center,
  );
}

Container headerWidget(String someText) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(bottom: 15),
    child: Center(child: textWidget(someText, Colors.white)),
    decoration: BoxDecoration(color: Colors.blueGrey),
  );
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _serialNumber = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final TextEditingController _zipcode_ext = TextEditingController();
  final TextEditingController _housenumber = TextEditingController();
  final TextEditingController _street = TextEditingController();
  Future<MeterInfo> _futureMeterInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Eleena Meter Activation")),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: headerWidget("Register meters")),
                  Center(child: textFieldWidget(_serialNumber, "Serienummer")),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 80),
                          Expanded(
                              child: textFieldWidget(_zipcode, "Postcode")),
                          Expanded(
                              child: textFieldWidget(_zipcode_ext, "Extentie")),
                          Expanded(
                              child:
                                  textFieldWidget(_housenumber, "Huisnummer")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(child: textFieldWidget(_street, "Straat")),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ButtonTheme(
                        minWidth: 150.0,
                        height: 50.0,
                        child: RaisedButton(
                          child: Text('Register meter',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              _futureMeterInfo = registerMeter(
                                  _serialNumber.text,
                                  null,
                                  int.parse(_zipcode.text),
                                  _zipcode_ext.text,
                                  int.parse(_housenumber.text),
                                  _street.text);
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
