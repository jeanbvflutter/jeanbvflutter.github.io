import 'package:flutter/material.dart';
import 'textfield_ui.dart';

Container registrationInfo(_street, _zipcode, _zipcodeExt, _housenumber) {
  return Container(
    child: Column(
      children: [
        Center(child: textFieldWidget(_street, "Straat")),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: 80),
                Expanded(
                  child: textFieldWidget(_zipcode, "Postcode"),
                ),
                Expanded(
                  child: textFieldWidget(_zipcodeExt, "Extentie"),
                ),
                Expanded(
                  child: textFieldWidget(_housenumber, "Huisnummer"),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
