import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meter_activation/entities/status_parser.dart';

Future<MeterCommandInfoInfo> getMeterCommands(String serialNumber) async {
  final queryParameters = {
    "serial_no": serialNumber,
  };

  final response = await http.get(
    Uri.https('energize.eleena.eu', '/home/get_commands', queryParameters),
    headers: <String, String>{
      'Content-Type': 'application/form-data; charset=UTF-8',
    }
  );

  if (response.statusCode == 200) {
    return MeterCommandInfoInfo.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 404) {
    return MeterCommandInfoInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class MeterCommandInfoInfo {
  List<Command> commands;

  MeterCommandInfoInfo({this.commands});

  factory MeterCommandInfoInfo.fromJson(Map<String, dynamic> json) {
    var list = json['status'] as List;
    List<Command> commandList = list.map((i) => Command.fromJson(i)).toList();
    return MeterCommandInfoInfo(commands: commandList);
  }
}

class Command {
  final String enteredAt;
  final int meter;
  final String result;
  final String type;

  Command({this.enteredAt, this.meter, this.result, this.type});

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      enteredAt: json['enteredAT'],
      meter: json['meter'],
      result: json['result'],
      type: json['type']
    );
  }
}
