import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/button_widget.dart';
import 'package:meter_activation/components/ui/fetch_installation_info_button.dart';
import 'package:meter_activation/components/ui/header_widget.dart';
import 'package:meter_activation/components/ui/register_meter_button.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import 'package:meter_activation/entities/installation_info.dart';
import 'dart:async';
import '../entities/register_meter.dart';
import '../components/ui/textfield_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

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
  String barcode = 'Unknown';
  bool isVisible = true;
  Future<InstallationInfo> _futureInstallationInfo;
  final TextEditingController _serialNumber = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final TextEditingController _zipcode_ext = TextEditingController();
  final TextEditingController _housenumber = TextEditingController();
  final TextEditingController _street = TextEditingController();
  Future<MeterInfo> _futureMeterInfo;

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

  FutureBuilder meterInformation(Future futureMeterInformation) {
    String status;

    return FutureBuilder<InstallationInfo>(
      future: futureMeterInformation,
      builder: (context, snapshot) {
        try {
          print("in here");
          status = snapshot.data.status.toString();
        } on Exception catch (_) {} catch (error) {
          return Text("");
        }
        if (status == 'Registered') {
          return Column(
            children: [
              registrationInfo(_street, _zipcode, _zipcode_ext, _housenumber),
              new RegisterMeterButton(registerMeter: registerMeterCallback),
            ],
          );
        } else {
          return Text("TEST");
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Eleena Meter Activation")),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Center(child: headerWidget("Investigate installation")),
                  Center(child: textFieldWidget(_serialNumber, "Serienummer")),
                  new FetchInstallationInfoButton(
                      fetchInstallationInfo: fetchInstallationInfoCallBack),
                  SizedBox(height: 20),
                  meterInformation(_futureInstallationInfo),
                  Row(
                    children: [
                      FetchInstallationInfoButton(
                          fetchInstallationInfo: fetchInstallationInfoCallBack),
                      SizedBox(width: 3),
                      ButtonWidget(
                        text: 'Scan Barcode',
                        onClicked: scanBarcode,
                      ),
                      ButtonWidget(
                        text: 'Geolocation',
                        onClicked: getLocation,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    try {
      final serialnumber = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this._serialNumber.text = serialnumber;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }


  getLocation() async
  {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      this._housenumber.text = first.featureName;
      this._street.text = first.thoroughfare;
      this._zipcode.text = first.postalCode.split(' ')[0];
      this._zipcode_ext.text = first.postalCode.split(' ')[1];
    });
  }
}
