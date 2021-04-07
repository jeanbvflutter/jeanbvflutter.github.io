import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MeterInfo> registerMeter(String serialNumber, int clientId, int zipCode,
    String zipCodeExt, int houseNumber, String streetName) async {
  final response = await http.post(
    Uri.https('jsonplaceholder.typicode.com', 'registerMeter'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'serial_number': serialNumber,
      'client_id': clientId,
      'zip_code': zipCode,
      'zip_code_ext': zipCodeExt,
      'house_number': houseNumber,
      'street_name': streetName,
    }),
  );
  if (response.statusCode == 201) {
    return MeterInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class MeterInfo {
  String serialNumber;
  int clientId;
  int zipCode;
  String zipCodeExt;
  int houseNumber;
  String streetName;

  MeterInfo(
      {this.serialNumber,
      this.clientId,
      this.streetName,
      this.zipCode,
      this.zipCodeExt,
      this.houseNumber});

  factory MeterInfo.fromJson(Map<String, dynamic> json) {
    return MeterInfo(
      serialNumber: json['serial_number'],
      clientId: json['client_id'],
      streetName: json['street_name'],
      zipCode: json['zip_code'],
      zipCodeExt: json['zip_code_ext'],
      houseNumber: json['house_number'],
    );
  }
}
