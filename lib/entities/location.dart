// import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';

// getLocation() async {
//     Position position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     debugPrint('location: ${position.latitude}');
//     final coordinates = new Coordinates(position.latitude, position.longitude);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = addresses.first;
//     setState(() {
//       this._houseNumber.text = first.featureName;
//       this._street.text = first.thoroughfare;
//       this._zipCode.text = first.postalCode.split(' ')[0];
//       this._zipcodeExt.text = first.postalCode.split(' ')[1];
//     });
//   }
// }