import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

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

class KeepAliveInfo extends StatusParser{

  KeepAliveInfo(status) : super(status);

  factory KeepAliveInfo.fromJson(Map<String, dynamic> json) {
    return KeepAliveInfo(
      json['status'],
    );
  }
}