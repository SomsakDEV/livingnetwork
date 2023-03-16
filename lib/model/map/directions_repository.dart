import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_gmaps/.env.dart';
import 'package:living_network/model/map/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;
  DirectionsRepository({required Dio dio}) : _dio = dio ?? Dio();
  // DirectionsRepository({Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': "AIzaSyBriR3_kCzOfST0t72bMUV1B3-p2fnJ_dw",
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }else {
      throw Exception('Failed to fetch directions');
    }
    // return null;
  }
}
