import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<ProductionInfo> newProductionTest(String serialNumber) async {
  var urlExt = 'get/productionTestForConnectedMeters';
  final queryParameters = {
    "serial_number": serialNumber,
  };

  final response = await http.get(
    Uri.http('https://polling.eleena.eu', urlExt, queryParameters),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return ProductionInfo.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
  }
}

Future<ProductionInfo> productionTest(String serialNumber) async {
  final response = await http.post(
    Uri.https('energize.eleena.eu', '/home/production_test_flutter'),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'serial_number': serialNumber,
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return ProductionInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class ProductionInfo extends StatusParser {
  String message;

  ProductionInfo(status, {this.message}) : super(status);

  factory ProductionInfo.fromJson(Map<String, dynamic> json) {
    return ProductionInfo(json['status'], message: json['message']);
  }
}

// data = {
// 'serial_number': serial_no,
// }
//
// production_test_button = elm;
// var activation_spinner = document.createElement('div');
// activation_spinner.className = "spinner-border";
// activation_spinner.setAttribute('id', 'activation_spinner')
// production_test_button.innerHTML = ''
// production_test_button.append(activation_spinner)
//
// $.ajax({
// url: "production_test",
// type: "POST",
// headers: {
// 'Access-Control-Allow-Origin': '*'
// },
// beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', 'Token ' + localStorage.getItem('token')); },
// data: data,
// success: function (data) {
// activation_spinner.remove()
// production_test_button.innerHTML = 'Production Test'
// alert(data['status']);
// },
// fail: function (data) {
// activation_spinner.remove()
// production_test_button.innerHTML = 'Production Test'
// alert(data['status']);
// }
// })
// }
