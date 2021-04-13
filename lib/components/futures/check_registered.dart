import 'package:flutter/material.dart';
import 'package:meter_activation/components/ui/registration_info.dart';
import '../../entities/installation_info.dart';

FutureBuilder meterInformation(Future futureMeterInformation) {
  String status;
  return FutureBuilder<InstallationInfo>(
    future: futureMeterInformation,
    builder: (context, snapshot) {
      status = snapshot.data.status.toString();
      if (status == 'Registered') {
        return registrationInfo(_street, _zipcode, _zipcode_ext, _housenumber);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}
