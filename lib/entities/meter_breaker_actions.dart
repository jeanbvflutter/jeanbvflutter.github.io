import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<MeterBreakerInfo> meterBreakerOn(String serialNumber) async {
  var urlExt = 'post/activateBreakerForConnectedMeters';
  final queryParameters = {
    "serial_number": serialNumber,
  };

  final response = await http.get(
    Uri.https('polling.eleena.eu', urlExt, queryParameters),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterBreakerInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

Future<MeterBreakerInfo> meterBreakerOff(String serialNumber) async {
  var urlExt = '/post/deactivateBreakerForConnectedMeters';

  final queryParameters = {
    "serial_number": serialNumber,
  };

  final response = await http.get(
    Uri.https('polling.eleena.eu', urlExt, queryParameters),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterBreakerInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterBreakerInfo extends StatusParser {
  bool actionStatus;
  MeterBreakerInfo(status, {this.actionStatus}) : super(status);

  factory MeterBreakerInfo.fromJson(Map<String, dynamic> json) {
    return MeterBreakerInfo(json['status'],
        actionStatus: json['action_status']);
  }
}