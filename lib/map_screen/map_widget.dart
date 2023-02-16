// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:living_network/map_screen/locations.dart' as locations;
import 'dart:ui' as ui;
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

const LatLng current = LatLng(56.172249, 10.187372);

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  final Map<MarkerId, Marker> _markers = {};
  // LatLng? _markerPosition;
  MarkerId? selectedMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, allowUpscaling: true, targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = _markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && _markers.containsKey(previousMarkerId)) {
          final Marker resetOld = _markers[previousMarkerId]!.copyWith(iconParam: BitmapDescriptor.defaultMarker);
          _markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        _markers[markerId] = newMarker;

        // _markerPosition = null;
      });
    }
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    _markers.clear();
    setState(() {
      for (final office in googleOffices.offices) {
        // final Uint8List markerIcon = await getBytesFromAsset(office.image, -10);
        final MarkerId markerId = MarkerId(office.name);
        final marker = Marker(
          markerId: markerId,
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
          // icon: BitmapDescriptor.fromBytes(markerIcon),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () => _onMarkerTapped(markerId),
        );
        _markers[markerId] = marker;
      }
    });
  }

  // Future<LocationData?> _currentLocation() async {
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;

  //   Location location = new Location();

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return null;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return null;
  //     }
  //   }
  //   return await location.getLocation();
  // }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: current,
        zoom: 17,
      ),
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers.values),
      mapToolbarEnabled: false,
      myLocationEnabled: true,
    );
  }
}
