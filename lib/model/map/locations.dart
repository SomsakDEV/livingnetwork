// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:living_network/model/map/locations_test_shop.dart';
import 'package:living_network/model/map/locations_test_wifi.dart';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.offices,
  });

  List<Office> offices;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        offices:
            List<Office>.from(json["offices"].map((x) => Office.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offices": List<dynamic>.from(offices.map((x) => x.toJson())),
      };
}

class Office {
  Office({
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
  });

  String id;
  String image;
  double lat;
  double lng;

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json["id"],
        image: json["image"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "lat": lat,
        "lng": lng,
      };
}

Future<Location> getGoogleOffices() async {
  // const googleLocationsURL = 'https://about.google/static/data/locations.json';
  // Retrieve the locations of Google offices
  // try {
  //   final response = await http.get(Uri.parse(googleLocationsURL));
  //   if (response.statusCode == 200) {
  //     return Locations.fromJson(json.decode(response.body) as Map<String, dynamic>);
  //   }
  // } catch (e) {
  //   if (kDebugMode) {
  //     print(e);
  //   }
  // }
  // Fallback for when the above HTTP request fails.

  final jsonShop =
      await rootBundle.loadString("assets/data/LM_CCSM_AISSHOP_BKK.geojson");
  LocationTestShop lotestshop =
      LocationTestShop.fromJson(json.decode(jsonShop));

  List<Office> listOfficeShop = [];

  for (var data in lotestshop.features!) {
    listOfficeShop.add(Office(
        id: "${data.properties?.cCSMLOCATIONCODE}",
        image: "assets/images/ais_shop.png",
        lat: data.properties?.lMLAT?.toDouble() ?? 0.0,
        lng: data.properties?.lMLONG?.toDouble() ?? 0.0));
  }

  final jsonWifi =
      await rootBundle.loadString("assets/data/LM_WIFI_AP_BKK.geojson");
  LocationTestWifi lotestwifi =
      LocationTestWifi.fromJson(json.decode(jsonWifi));

  List<Office> listOfficeWifi = [];

  for (var data in lotestwifi.features!) {
    listOfficeWifi.add(Office(
        id: "${data.properties?.sLMSERVICEAREACODE}",
        image: "assets/images/ais_wifi.png",
        lat: data.properties?.lMLAT?.toDouble() ?? 0.0,
        lng: data.properties?.lMLONG?.toDouble() ?? 0.0));
  }

  Location loshop = Location(offices: listOfficeShop);
  Location lowifi = Location(offices: listOfficeWifi);

  Location lo = locationFromJson(
      '{"offices":[{"id":"current cellular","image":"assets/images/cellular_current.png","lat":13.783889514456709,"lng":100.5471371883403}]}');
  return lowifi;
}

Future<List<String>> getListShop() async {
  final jsonShop =
      await rootBundle.loadString("assets/data/LM_CCSM_AISSHOP_BKK.geojson");
  LocationTestShop lotestshop =
      LocationTestShop.fromJson(json.decode(jsonShop));

  List<String> listOfficeShop = [];
  int i = 0;
  for (var data in lotestshop.features!) {
    i++;
    if (i > 5) {
      break;
    }
    listOfficeShop.add("${data.properties?.cCSMPARTNERNAME}");
  }
  return listOfficeShop;
}

Future<List<String>> getListWifi() async {
  final jsonWifi =
      await rootBundle.loadString("assets/data/LM_WIFI_AP_BKK.geojson");

  LocationTestWifi lotestwifi =
      LocationTestWifi.fromJson(json.decode(jsonWifi));

  List<String> listOfficeWifi = [];
  int i = 0;
  for (var data in lotestwifi.features!) {
    i++;
    if (i > 5) {
      break;
    }
    listOfficeWifi.add("${data.properties?.lMAMPNAMT}");
  }
  return listOfficeWifi;
}
