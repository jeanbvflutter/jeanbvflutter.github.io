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

  final response = await http.get(
    Uri.http('104.248.82.49:8888', urlExt, queryParameters),
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

  MeterConnectionInfo(status, {this.message}) : super(status);

  factory MeterConnectionInfo.fromJson(Map<String, dynamic> json) {
    return MeterConnectionInfo(json['status'], message: json['message']);
  }
}
