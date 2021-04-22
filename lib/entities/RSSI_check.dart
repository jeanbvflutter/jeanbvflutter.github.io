import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<RSSIInfo> RSSIcheck(String serialNumber) async {
  print("IN RSSI");
  var urlExt = 'get/readRSSI';
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
    return RSSIInfo.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed');
  }
}

class RSSIInfo extends StatusParser {
  String message;
  RSSIInfo(status, {this.message}) : super(status);

  factory RSSIInfo.fromJson(Map<String, dynamic> json) {
    return RSSIInfo(json['status'], message: json['message']);
  }
}
