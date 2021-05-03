import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<MeterConnectionInfo> connectMeter(String serialNumber) async {
  var urlExt = 'post/connectMeter';
  final queryParameters = {
    "serial_number": serialNumber,
  };
  print(Uri.https('polling.eleena.eu', urlExt, queryParameters));
  final response = await http.get(
    Uri.https('polling.eleena.eu', urlExt, queryParameters),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterConnectionInfo.fromJson(jsonDecode(response.body));
  } else {
    print("RESPONSE" + response.body);
    throw Exception('Failed');
  }
}

class MeterConnectionInfo extends StatusParser {
  String message;
  bool actionStatus;

  MeterConnectionInfo(status, {this.message, this.actionStatus})
      : super(status);

  factory MeterConnectionInfo.fromJson(Map<String, dynamic> json) {
    return MeterConnectionInfo(json['status'],
        message: json['message'], actionStatus: json['action_status']);
  }
}