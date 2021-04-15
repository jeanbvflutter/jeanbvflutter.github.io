import 'package:flutter/material.dart';
import 'package:meter_activation/entities/register_meter.dart';
import '../../entities/installation_info.dart';

FutureBuilder meterRegistration(
    String data, Future futureMeterRegistrationInfo) {
  String showMeterRegistrationInfo;
  return FutureBuilder<MeterInfo>(
    future: futureMeterRegistrationInfo,
    builder: (context, snapshot) {
      switch (data) {
        case 'status':
          {
            print("IN HEREEEE");
            try {
              showMeterRegistrationInfo = snapshot.data.status.toString();
            } on Exception catch (_) {} catch (error) {
              showMeterRegistrationInfo = 'Meter registration process';
            }
          }
          break;
        default:
          {
            showMeterRegistrationInfo = 'Meter registration process';
          }
      }
      if (snapshot.hasData) {
        return Text(showMeterRegistrationInfo);
      } else if (snapshot.hasError) {
        print("ERROR");
        return Text("No data");
      }
      return Text(showMeterRegistrationInfo);
    },
  );
}
