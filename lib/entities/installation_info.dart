import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<InstallationInfo> fetchInstallationInfo() async {
    var http;
    final response =
      await http.get(Uri.https('energize.eleena.eu', '/external/get-client-info-by-serial-number'));

    if(response.statusCode == 200){
      return InstallationInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
}

class InstallationInfo {
  // Meter details
  final int status;
  final int breakerStatus;
  final int meterId;
  final int cumulativeProduction;

  // Client details
  final int clientId;
  final String loginName;
  final String lastName;
  final String firstName;
  final String email;
  final String clientSource;



  InstallationInfo({this.status, this.breakerStatus, this.meterId, this.cumulativeProduction, this.clientId, this.loginName, this.lastName, this.firstName, this.email, this.clientSource});

  factory InstallationInfo.fromJson(Map<String, dynamic> json) {
    return InstallationInfo(
      status: json['meter_information']['status'],
      breakerStatus: json['meter_information']['breaker_status'],
      meterId: json['meter_information']['id'],
      cumulativeProduction: 100,
      clientId: json['cliennt_information']['id'],
      loginName: json['client_information']['login_name'],
      lastName: json['client_information']['last_name'],
      firstName: json['client_information']['first_name'],
      email: json['client_information']['email'],
      clientSource: json['client_information']['client_source'],
    );
  }
}
