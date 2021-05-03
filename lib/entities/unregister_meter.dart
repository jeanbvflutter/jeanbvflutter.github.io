import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<UnRegisterMeterInfo> unregisterMeter(String serialNumber) async {
  // var http;

  final response = await http.post(
    Uri.https('energize.eleena.eu', '/home/unregister_meter_flutter'),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'serial_number': serialNumber,
    }),
  );

  if (response.statusCode == 200) {
    print("SERIAL NUMBER" + serialNumber);
    print("RESPONSE" + response.body);
    return UnRegisterMeterInfo.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 404) {
    print("NUMBER" + serialNumber);
    print("RESPONSE" + response.body);
    return UnRegisterMeterInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class UnRegisterMeterInfo extends StatusParser {
  String message;
  UnRegisterMeterInfo(status, {this.message}) : super(null);

  factory UnRegisterMeterInfo.fromJson(Map<String, dynamic> json) {
    return UnRegisterMeterInfo(json['status'], message: json['status']);
  }
}
