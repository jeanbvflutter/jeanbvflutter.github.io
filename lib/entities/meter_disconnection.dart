import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<MeterDisconnectionInfo> disconnectMeter(String serialNumber) async {
  print("DISCONNECTING METER");
  var urlExt = 'post/disconnectMeter';
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
    return MeterDisconnectionInfo.fromJson(jsonDecode(response.body));
  } else {
    print("TEST");
    print(response.body);
    throw Exception('Failed');
  }
}

class MeterDisconnectionInfo extends StatusParser {
  String message;
  MeterDisconnectionInfo(status, {this.message}) : super(status);

  factory MeterDisconnectionInfo.fromJson(Map<String, dynamic> json) {
    return MeterDisconnectionInfo(json['status'], message: json['message']);
  }
}
