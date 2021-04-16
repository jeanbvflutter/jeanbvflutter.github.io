import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

// DOES NOT REQUIRE CONNECTION TO METER
Future<MeterHealthCheckInfo> healthCheckMeter(String serialNumber) async {

  var urlExt = '/meterHealthCheck?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', urlExt),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return MeterHealthCheckInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterHealthCheckInfo extends StatusParser{

  MeterHealthCheckInfo(status) : super(status);

  factory MeterHealthCheckInfo.fromJson(Map<String, dynamic> json) {
    return MeterHealthCheckInfo(
      json['alive'],
    );
  }
}