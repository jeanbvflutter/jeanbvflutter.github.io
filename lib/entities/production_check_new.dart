import 'dart:convert';

import 'package:http/http.dart' as http;

Future<ProductionInfo> productionTest(String serialNumber) async {
  var urlExt = '/meterHealthCheck?serial_number=$serialNumber';

  final response = await http.get(
    Uri.https('104.248.82.49:8888', '/get/productionTestForConnectedMeters'),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return ProductionInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class ProductionInfo {
  String status;

  ProductionInfo(
      {this.status});

  factory ProductionInfo.fromJson(Map<String, dynamic> json) {
    return ProductionInfo(
      status: json['status'],
    );
  }
}
