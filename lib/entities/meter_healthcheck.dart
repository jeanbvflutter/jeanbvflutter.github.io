import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// DOES NOT REQUIRE CONNECTION TO METER
Future<MeterHealthCheckInfo> healthCheckMeter(String serialNumber) async {

  var urlExt = '/meterHealthCheck?serial_number=$serialNumber';

  final response = await http.post(
    Uri.https('104.248.82.49:8888', urlExt),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },

    body: jsonEncode(<String, dynamic>{
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterHealthCheckInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterHealthCheckInfo {
  String status;

  MeterHealthCheckInfo(
      {this.status});

  factory MeterHealthCheckInfo.fromJson(Map<String, dynamic> json) {
    return MeterHealthCheckInfo(
      status: json['alive'],
    );
  }
}