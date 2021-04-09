import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField textFieldWidget(_controller, String _hintText) {
  String regex;

  switch (_hintText.toLowerCase()) {
    case "serienummer":
      {
        regex = r'^[a-zA-Z0-9]{0,17}';
      }
      break;
    case "postcode":
      {
        regex = r'^[0-9]{0,5}';
      }
      break;
    case "extentie":
      {
        regex = r'^[A-Z]{0,2}';
      }
      break;
    case "huisnummer":
      {
        regex = r'^[0-9]{0,5}';
      }
      break;
    case "straat":
      {
        regex = r'^[a-zA-Z]{0,30}';
      }
      break;
    default:
      regex = r'^[(.*?)]';
  }
  return TextField(
    controller: _controller,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(regex)),
    ],
    decoration:
        InputDecoration(border: OutlineInputBorder(), hintText: _hintText),
  );
}
