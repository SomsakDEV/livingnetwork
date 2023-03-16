// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:living_network/model/map/locations_test_shop.dart';
import 'package:living_network/model/map/locations_test_wifi.dart';

PlaceLocation locationFromJson(String str) =>
    PlaceLocation.fromJson(json.decode(str));

String locationToJson(PlaceLocation data) => json.encode(data.toJson());

class PlaceLocation {
  PlaceLocation({
    required this.signal_nearby,
  });

  List<SignalNearBy> signal_nearby;

  factory PlaceLocation.fromJson(Map<String, dynamic> json) => PlaceLocation(
        signal_nearby: List<SignalNearBy>.from(
            json["signal_nearby"].map((x) => SignalNearBy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "signal_nearby":
            List<dynamic>.from(signal_nearby.map((x) => x.toJson())),
      };
}

class SignalNearBy {
  SignalNearBy({
    required this.id,
    required this.imagetype,
    required this.lat,
    required this.lng,
    required this.dist,
  });

  String id;
  String imagetype;
  double lat;
  double lng;
  double dist;

  factory SignalNearBy.fromJson(Map<String, dynamic> json) => SignalNearBy(
        id: json["id"],
        imagetype: json["imagetype"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        dist: json["dist"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagetype": imagetype,
        "lat": lat,
        "lng": lng,
        "dist": dist,
      };
}

Future<List<SignalNearBy>> getSignalNearBy() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"ais building1","imagetype":"shop","lat":13.783889514456709,"lng":100.5471371883403,"dist":100},{"id":"bangmot","imagetype":"wifi","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}

Future<List<SignalNearBy>> getSignalNearByShop() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"ais building1","imagetype":"shop","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}

Future<List<SignalNearBy>> getSignalNearByWifi() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"bangmot","imagetype":"wifi","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}

