import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/address_information.dart';
import 'package:meter_activation/components/ui/fetch_installation_info_button.dart';
import 'package:meter_activation/components/ui/header_widget.dart';
import 'package:meter_activation/components/ui/register_meter_button.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'dart:async';
import '../entities/register_meter.dart';
import '../components/ui/textfield_ui.dart';
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

class _MainPageState extends State<MainPage> {
  Future<InstallationInfo> _futureInstallationInfo;
  final TextEditingController _serialNumber = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final TextEditingController _zipcode_ext = TextEditingController();
  final TextEditingController _housenumber = TextEditingController();
  final TextEditingController _street = TextEditingController();
  Future<MeterInfo> _futureMeterInfo;

  // @override
  // void initState() {
  //   super.initState();
  //   _futureInstallationInfo = fetchInstallationInfo();
  // }

  // void futureInstallationInfoSetState() {
  //   setState(() {
  //     this._futureInstallationInfo = fetchInstallationInfo();
  //   });
  // }

  fetchInstallationInfoCallBack() {
    setState(() {
      _futureInstallationInfo = fetchInstallationInfo(_serialNumber.text);
    });
  }

  registerMeterCallback() {
    setState(() {
      _futureMeterInfo = registerMeter(
          _serialNumber.text,
          null,
          int.parse(_zipcode.text),
          _zipcode_ext.text,
          int.parse(_housenumber.text),
          _street.text);
    });
  }

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
                  Center(child: headerWidget("Investigate installation")),
                  Center(child: textFieldWidget(_serialNumber, "Serienummer")),
                  SizedBox(height: 10),
                  registrationInfo(_street, _zipcode, _zipcode_ext, _housenumber),
                  new FetchInstallationInfoButton(fetchInstallationInfo: fetchInstallationInfoCallBack),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
