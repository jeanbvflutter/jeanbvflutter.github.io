import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

// DOES NOT REQUIRE CONNECTION TO METER
Future<MeterHealthCheckInfo> healthCheckMeter(String serialNumber) async {
  var urlExt = 'meterHealthChecker';
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
    return MeterHealthCheckInfo.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
  }
}

class MeterHealthCheckInfo extends StatusParser {
  String message;

  MeterHealthCheckInfo(status, {this.message}) : super(status);

  factory MeterHealthCheckInfo.fromJson(Map<String, dynamic> json) {
    return MeterHealthCheckInfo(json['status'], message: json['message']);
  }
}
