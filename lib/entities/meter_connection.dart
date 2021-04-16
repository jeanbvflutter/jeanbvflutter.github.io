import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<MeterConnectionInfo> connectMeter(String serialNumber) async {
  var urlExt = 'post/connectMeter?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', urlExt),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterConnectionInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterConnectionInfo {
  String status;
  String message;
  MeterConnectionInfo({this.status, this.message});

  factory MeterConnectionInfo.fromJson(Map<String, dynamic> json) {
    bool status;
    String newStatus;
    String message;

    status = json['status'];
    message = json['message'];

    if (status == true) {
      newStatus = "OK";
    } else if (status == false) {
      newStatus = "error";
    }
    return MeterConnectionInfo(status: newStatus, message: message);
  }
}
