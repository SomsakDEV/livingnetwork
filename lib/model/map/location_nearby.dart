import 'dart:convert';

PlaceLocation locationFromJson(String str) =>
    PlaceLocation.fromJson(json.decode(str));

String locationToJson(PlaceLocation data) => json.encode(data.toJson());

class PlaceLocation {
  PlaceLocation({
    required this.signal_nearby,
  });

  List<LocationNearBy> signal_nearby;

  factory PlaceLocation.fromJson(Map<String, dynamic> json) => PlaceLocation(
        signal_nearby: List<LocationNearBy>.from(
            json["signal_nearby"].map((x) => LocationNearBy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "signal_nearby":
            List<dynamic>.from(signal_nearby.map((x) => x.toJson())),
      };
}

class LocationNearBy {
  LocationNearBy({
    required this.id,
    required this.name,
    required this.imagetype,
    required this.lat,
    required this.lng,
    required this.dist,
  });

  String id;
  String name;
  String imagetype;
  double lat;
  double lng;
  double dist;

  factory LocationNearBy.fromJson(Map<String, dynamic> json) => LocationNearBy(
        id: json["id"],
        name: json["name"],
        imagetype: json["imagetype"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        dist: json["dist"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imagetype": imagetype,
        "lat": lat,
        "lng": lng,
        "dist": dist,
      };
}

Future<List<LocationNearBy>> getSignalNearBy() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"ais building1","imagetype":"shop","lat":13.783889514456709,"lng":100.5471371883403,"dist":100},{"id":"bangmot","imagetype":"wifi","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}

Future<List<LocationNearBy>> getSignalNearByShop() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"ais building1","imagetype":"shop","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}

Future<List<LocationNearBy>> getSignalNearByWifi() async {
  PlaceLocation lonearby = locationFromJson(
      '{"signal_nearby":[{"id":"bangmot","imagetype":"wifi","lat":13.783889514456709,"lng":100.5471371883403,"dist":100}]}');

  return lonearby.signal_nearby;
}
