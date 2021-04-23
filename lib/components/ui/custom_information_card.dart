import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/address_information.dart';
import 'package:meter_activation/components/futures/client_information.dart';
import 'package:meter_activation/components/futures/meter_information.dart';
import 'package:meter_activation/components/ui/header_info.dart';

class CustomInformationCard extends StatefulWidget {
  Future information;
  Function futureBuilder;
  String headerInfoText;
  var buttonInfoList;

  CustomInformationCard(
      {this.information,
      this.futureBuilder,
      this.headerInfoText,
      this.buttonInfoList});

  @override
  _CustomInformationCardState createState() => _CustomInformationCardState();
}

class _CustomInformationCardState extends State<CustomInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(5)),
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              headerInfoWidget(widget.headerInfoText),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    for (List info in widget.buttonInfoList)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(info[0]),
                                widget.futureBuilder(
                                    info[1], widget.information),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
