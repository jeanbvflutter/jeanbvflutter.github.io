import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

// DOES NOT REQUIRE CONNECTION TO METER
Future<MeterHealthCheckInfo> healthCheckMeter(String serialNumber) async {
  var urlExt = 'meterHealthChecker';
  final queryParameters = {
    "serial_number": serialNumber,
  };

  print(Uri.https('polling.eleena.eu', urlExt, queryParameters));

  final response = await http.get(
    Uri.https('polling.eleena.eu', urlExt, queryParameters),
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
  bool actionStatus;

  MeterHealthCheckInfo(status, {this.message, this.actionStatus})
      : super(status);

  factory MeterHealthCheckInfo.fromJson(Map<String, dynamic> json) {
    return MeterHealthCheckInfo(json['status'],
        message: json['message'], actionStatus: json['action_status']);
  }
}
