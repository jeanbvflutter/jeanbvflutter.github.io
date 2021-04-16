import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<MeterActivationInfo> activateMeter(String serialNumber) async {

  var urlExt = 'post/activateMeterForConnectedMeters?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', urlExt),
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

class MeterActivationInfo {
  String status;

  MeterActivationInfo(
      {this.status});

  factory MeterActivationInfo.fromJson(Map<String, dynamic> json) {
    return MeterActivationInfo(
      status: json['status'],
    );
  }
}