import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<KeepAliveInfo> keepAliveMeter(String serialNumber) async {

  var urlExt = '/keepAlive?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', urlExt),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return KeepAliveInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class KeepAliveInfo {
  String status;

  KeepAliveInfo(
      {this.status});

  factory KeepAliveInfo.fromJson(Map<String, dynamic> json) {
    return KeepAliveInfo(
      status: json['status'],
    );
  }
}