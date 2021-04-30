import 'package:flutter/material.dart';
import 'package:meter_activation/components/futures/address_information.dart';
import 'package:meter_activation/components/futures/client_information.dart';
import 'package:meter_activation/components/futures/meter_information.dart';
import 'package:meter_activation/components/ui/header_info.dart';

import 'custom_information_card.dart';

Card installationInformationCard(Future futureInstallationInformation) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(5)),
    child: Container(
      // padding: EdgeInsets.all(10.0),
      // chil
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                headerInfoWidget("Client Information"),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("ID: "),
                                  clientInformation(
                                      "clientId", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Achternaam: "),
                                  clientInformation(
                                      "lastName", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Voornaam: "),
                                  clientInformation("firstName",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("E-mail: "),
                                  clientInformation(
                                      "email", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Bron: "),
                                  clientInformation("clientSource",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                headerInfoWidget("Addres Information"),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Postcode: "),
                                  addressInformation(
                                      "zipCode", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Extentie: "),
                                  addressInformation("zipCodeExt",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Straat: "),
                                  addressInformation(
                                      "street", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Huisnumqsdqsdmer: "),
                                  addressInformation("houseNumber",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("City: "),
                                  addressInformation(
                                      "city", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                headerInfoWidget("Meter Information"),
                Container(
                    margin: EdgeInsets.all(29.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Serienummer: "),
                                  meterInformation("serialNumber",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Status: "),
                                  meterInformation(
                                      "status", futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Breaker status: "),
                                  meterInformation("breakerStatus",
                                      futureInstallationInformation)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
