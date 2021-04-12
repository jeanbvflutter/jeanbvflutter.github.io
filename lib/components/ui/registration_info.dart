import 'package:flutter/material.dart';
import 'textfield_ui.dart';

Container registrationInfo(_zipcode, _zipcode_ext, _housenumber){
  margin: EdgeInsets.only(top: 10);
  child: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // SizedBox(height: 80),
        Expanded(
            child: textFieldWidget(_zipcode, "Postcode")),
        Expanded(
            child: textFieldWidget(_zipcode_ext, "Extentie")),
        Expanded(
            child:
                textFieldWidget(_housenumber, "Huisnummer")),
      ],
    ),
    );
  }