import 'dart:convert';

import 'package:http/http.dart' as http;

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
