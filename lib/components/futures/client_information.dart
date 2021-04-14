import 'package:flutter/material.dart';
import '../../entities/installation_info.dart';

FutureBuilder clientInformation(
  String data, Future futureClientInformation){
    String showClientInfo;
    return FutureBuilder<InstallationInfo>(
      future: futureClientInformation,
      builder: (context, snapshot) {
        switch(data){
          case 'clientId':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'loginName':
          {
            showClientInfo = snapshot.data.loginName.toString();
          }
          break;
          case 'lastName':
          {
            showClientInfo = snapshot.data.lastName.toString();
          }
          break;
          case 'firstName':
          {
            showClientInfo = snapshot.data.firstName.toString();
          }
          break;
          case 'email':
          {
            showClientInfo = snapshot.data.email.toString();
          }
          break;
          case 'clientSource':
          {
            showClientInfo = snapshot.data.clientSource.toString();
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
