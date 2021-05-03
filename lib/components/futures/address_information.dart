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
            showClientInfo = snapshot.data.zipCode.toString();
          }
          break;
          case 'zipCodeExt':
          {
            showClientInfo = snapshot.data.zipCodeExt.toString();
          }
          break;
          case 'houseNumber':
          {
            showClientInfo = snapshot.data.houseNumber.toString();
          }
          break;
          case 'street':
          {
            showClientInfo = snapshot.data.street.toString();
          }
          break;
          case 'city':
          {
            showClientInfo = snapshot.data.city.toString();
          }
          break;
        }
        if (snapshot.hasData) {
          return Text(showClientInfo);
        } else if (snapshot.hasError){
          return CircularProgressIndicator();
        }
        return CircularProgressIndicator();
      },
    );
  }
