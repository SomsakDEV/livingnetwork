// // To parse this JSON data, do
// //
// //     final location = locationFromJson(jsonString);

// import 'dart:convert';

// Location locationFromJson(String str) => Location.fromJson(json.decode(str));

// String locationToJson(Location data) => json.encode(data.toJson());

// class Location {
//   Location({
//     required this.offices,
//   });

//   List<Office> offices;

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         offices: List<Office>.from(json["offices"].map((x) => Office.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "offices": List<dynamic>.from(offices.map((x) => x.toJson())),
//       };
// }

// class Office {
//   Office({
//     required this.id,
//     required this.image,
//     required this.lat,
//     required this.lng,
//   });

//   String id;
//   String image;
//   double lat;
//   double lng;

//   factory Office.fromJson(Map<String, dynamic> json) => Office(
//         id: json["id"],
//         image: json["image"],
//         lat: json["lat"]?.toDouble(),
//         lng: json["lng"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "lat": lat,
//         "lng": lng,
//       };
// }

// Future<Location> getGoogleOffices() async {
//   // const googleLocationsURL = 'https://about.google/static/data/locations.json';
//   // Retrieve the locations of Google offices
//   // try {
//   //   final response = await http.get(Uri.parse(googleLocationsURL));
//   //   if (response.statusCode == 200) {
//   //     return Locations.fromJson(json.decode(response.body) as Map<String, dynamic>);
//   //   }
//   // } catch (e) {
//   //   if (kDebugMode) {
//   //     print(e);
//   //   }
//   // }
//   // Fallback for when the above HTTP request fails.
//   Location lo = locationFromJson(
//       '{"offices":[{"id":"current cellular","image":"assets/images/cellular_current.png","lat":13.783889514456709,"lng":100.5471371883403}]}');
//   return lo;
// }
