import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MeterConnectionInfo> connectMeter(String serialNumber) async {

  var urlExt = '/connectMeter?serial_number=$serialNumber';

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
    return MeterConnectionInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterConnectionInfo {
  String status;

  MeterConnectionInfo(
      {this.status});

  factory MeterConnectionInfo.fromJson(Map<String, dynamic> json) {
    return MeterConnectionInfo(
      status: json['status'],
    );
  }
}