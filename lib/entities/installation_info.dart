import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<InstallationInfo> fetchInstallationInfo(String serialNumber) async {
  // var http;
  final queryParameters = {
   "serial_number": serialNumber,
};
  final response = await http.get(
    Uri.http('0.0.0.0:8001', '/rest/get-client-info-by-serial-number/', queryParameters),
  );

  if (response.statusCode == 200) {
    print("RESPONSE" + response.body);
    return InstallationInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class InstallationInfo {
  // Meter details
  final String status;
  final String breakerStatus;
  final int meterId;
  final int cumulativeProduction;

  // Client details
  final int clientId;
  final String loginName;
  final String lastName;
  final String firstName;
  final String email;
  final String clientSource;

  // address details
  // final String zipCode;
  // final String zipCodeExt;
  // final String houseNumber;
  // final String street;
  // final String city;

  InstallationInfo(
      {this.status,
      this.breakerStatus,
      this.meterId,
      this.cumulativeProduction,
      this.clientId,
      this.loginName,
      this.lastName,
      this.firstName,
      this.email,
      this.clientSource,
      // this.zipCode,
      // this.zipCodeExt,
      // this.houseNumber,
      // this.street,
      // this.city
      });

  factory InstallationInfo.fromJson(Map<String, dynamic> json) {
    return InstallationInfo(
      status: json['meter_information'][0]['status'],
      breakerStatus: json['meter_information'][0]['breaker_status'],
      meterId: json['meter_information'][0]['id'],
      cumulativeProduction: 100,
      clientId: json['client_information'][0]['id'],
      loginName: json['client_information'][0]['login_name'],
      lastName: json['client_information'][0]['last_name'],
      firstName: json['client_information'][0]['first_name'],
      email: json['client_information'][0]['email'],
      clientSource: json['client_information'][0]['client_source'],
    );
  }
}
