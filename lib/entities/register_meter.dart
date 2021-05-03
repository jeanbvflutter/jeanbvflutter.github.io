import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MeterInfo> registerMeter(String serialNumber, int clientId, int zipCode,
    String zipCodeExt, int houseNumber, String streetName) async {
  final response = await http.post(
    Uri.https('energize.eleena.eu', '/home/register_meter_flutter'),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'serial_number': serialNumber,
      'client_id': null,
      'zip_code': zipCode,
      'zip_code_ext': zipCodeExt,
      'house_number': houseNumber,
      'street_name': streetName,
    }),
  );
  if (response.statusCode == 200) {
    print("RESPONSE" + response.body);
    return MeterInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterInfo {
  String status;
  String message;

  MeterInfo({this.status, this.message});

  factory MeterInfo.fromJson(Map<String, dynamic> json) {
    try {
      return MeterInfo(
        status: json['status'],
        message: json['message'],
      );
    } on Exception catch (_) {} catch (error) {
      return MeterInfo(status: null, message: null);
    }
  }
}