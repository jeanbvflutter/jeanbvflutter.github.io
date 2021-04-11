import 'package:flutter/material.dart';
import '../../entities/installation_info.dart';

FutureBuilder addressInformation(
  String data, Future futureAddressInformation){
    String showClientInfo;
    return FutureBuilder<InstallationInfo>(
      future: futureAddressInformation,
      builder: (context, snapshot) {
        switch(data){
          case 'zipCode':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'zipCodeExt':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'houseNumber':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'street':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'city':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
        }
        if (snapshot.hasData) {
          return Text(showClientInfo);
        } else if (snapshot.hasError){
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
