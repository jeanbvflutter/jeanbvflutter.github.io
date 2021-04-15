import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<MeterDeactivationInfo> deactivateMeter(String serialNumber) async {

  var urlExt = 'post/deactivateMeterForConnectedMeters?serial_number=$serialNumber';

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
    return MeterDeactivationInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterDeactivationInfo {
  String status;

  MeterDeactivationInfo(
      {this.status});

  factory MeterDeactivationInfo.fromJson(Map<String, dynamic> json) {
    return MeterDeactivationInfo(
      status: json['status'],
    );
  }
}