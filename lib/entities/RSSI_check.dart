import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<RSSIInfo> RSSIcheck(String serialNumber) async {
  var urlExt = 'get/readRSSI?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', urlExt),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return RSSIInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class RSSIInfo extends StatusParser{

  RSSIInfo(status) : super(null);

  factory RSSIInfo.fromJson(Map<String, dynamic> json) {
    return RSSIInfo(
      json['status'],
    );
  }
}
