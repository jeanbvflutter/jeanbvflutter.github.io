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
            showClientInfo = snapshot.data.status.toString();
          }
          break;
          case 'breakerStatus':
          {
            showClientInfo = snapshot.data.breakerStatus.toString();
          }
          break;
          case 'meterId':
          {
            showClientInfo = snapshot.data.meterId.toString();
          }
          break;
          case 'cumulativeProduction':
          {
            showClientInfo = snapshot.data.cumulativeProduction.toString();
          }
          break;
          case 'serialNumber':
          {
            showClientInfo = snapshot.data.serialNumber.toString();
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
