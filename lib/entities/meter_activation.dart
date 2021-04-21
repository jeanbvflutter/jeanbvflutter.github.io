import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<MeterActivationInfo> activateMeter(String serialNumber) async {
  var urlExt = 'post/activateMeterForConnectedMeters';
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
    return MeterActivationInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

Future<MeterActivationInfo> deactivateMeter(String serialNumber) async {
  var urlExt = 'post/deactivateMeterForConnectedMeters';
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
    return MeterActivationInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterActivationInfo extends StatusParser {

  MeterActivationInfo(status) : super(status);

  factory MeterActivationInfo.fromJson(Map<String, dynamic> json) {
    return MeterActivationInfo(
      json['status'],
    );
  }
}