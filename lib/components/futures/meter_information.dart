import 'package:flutter/material.dart';
import '../../entities/installation_info.dart';

FutureBuilder meterInformation(
  String data, Future futureMeterInformation){
    String showClientInfo;
    return FutureBuilder<InstallationInfo>(
      future: futureMeterInformation,
      builder: (context, snapshot) {
        switch(data){
          case 'status':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'breakerStatus':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'meterId':
          {
            showClientInfo = snapshot.data.clientId.toString();
          }
          break;
          case 'scumulativeProductiontreet':
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
