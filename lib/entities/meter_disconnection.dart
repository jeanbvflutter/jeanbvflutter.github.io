import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MeterDisconnectionInfo> disconnectMeter(String serialNumber) async {

  var urlExt = '/disconnectMeter?serial_number=$serialNumber';

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
    return MeterDisconnectionInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterDisconnectionInfo {
  String status;

  MeterDisconnectionInfo(
      {this.status});

  factory MeterDisconnectionInfo.fromJson(Map<String, dynamic> json) {
    return MeterDisconnectionInfo(
      status: json['disconnected_status'],
    );
  }
}