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
    Uri.https('energize.eleena.eu', '/rest/get-client-info-by-serial-number/', queryParameters),
  );

  if (response.statusCode == 200) {
    print("RESPONSE" + response.body);
    return InstallationInfo.fromJson(jsonDecode(response.body));
  }else if (response.statusCode == 404) {
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
  final String serialNumber;  

  // Client details
  final int clientId;
  final String loginName;
  final String lastName;
  final String firstName;
  final String email;
  final String clientSource;

  // address details
  final String zipCode;
  final String zipCodeExt;
  final String houseNumber;
  final String street;
  final String city;

  InstallationInfo(
      {this.status,
      this.breakerStatus,
      this.meterId,
      this.cumulativeProduction,
      this.serialNumber,
      this.clientId,
      this.loginName,
      this.lastName,
      this.firstName,
      this.email,
      this.clientSource,
      this.zipCode,
      this.zipCodeExt,
      this.houseNumber,
      this.street,
      this.city
      });

  factory InstallationInfo.fromJson(Map<String, dynamic> json) {
    try {
      final clientId = json['client_information'][0]['id'];
      final loginName = json['client_information'][0]['login_name'];
      final lastName = json['client_information'][0]['last_name'];
      final firstName = json['client_information'][0]['first_name'];
      final email = json['client_information'][0]['email'];
      final clientSource = json['client_information'][0]['client_source'];


      final zipCode = json['address_information']['zip_code'];
      final zipCodeExt = json['address_information']['zip_code_ext'];
      final street = json['address_information']['street'];
      final houseNumber = json['address_information']['house_number'];
      final city = json['address_information']['city'];

      return InstallationInfo(
      status: json['meter_information'][0]['status'],
      breakerStatus: json['meter_information'][0]['breaker_status'],
      meterId: json['meter_information'][0]['id'],
      serialNumber: json['meter_information'][0]['serial_number'],
      cumulativeProduction: 100,
      clientId: clientId,
      loginName: loginName,
      lastName: lastName,
      firstName: firstName,
      email: email,
      clientSource: clientSource,
      zipCode: zipCode,
      zipCodeExt: zipCodeExt,
      houseNumber: houseNumber,
      street: street,
      city: city,
    );

    }
     on Exception catch (_) {} catch (error){
      final clientId = null;
      final loginName = null;
      final lastName = null;
      final firstName = null;
      final email = null;
      final clientSource = null;
      final zipCode = null;
      final zipCodeExt = null;
      final street = null;
      final houseNumber = null;
      final city = null;
      
      
      
      return InstallationInfo(
      status: json['meter_information'][0]['status'],
      breakerStatus: json['meter_information'][0]['breaker_status'],
      meterId: json['meter_information'][0]['id'],
      serialNumber: json['meter_information'][0]['serial_number'],
      cumulativeProduction: 100,
      clientId: clientId,
      loginName: loginName,
      lastName: lastName,
      firstName: firstName,
      email: email,
      clientSource: clientSource,
      zipCode: zipCode,
      zipCodeExt: zipCodeExt,
      houseNumber: houseNumber,
      street: street,
      city: city,
    );
    
      }

  }
}
