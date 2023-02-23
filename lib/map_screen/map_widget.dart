import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:living_network/map_screen/locations.dart' as locations;
import 'dart:ui' as ui;

const LatLng current = LatLng(13.783436694916446, 100.5466938454706);

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
    ByteData data = await rootBundle.load('packages/living_network/$path');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, allowUpscaling: true, targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    _markers.clear();
    for (final office in googleOffices.offices) {
      String img = office.image;
      int size = 200;
      if ('assets/images/cellular_other.png' == img) {
        size = 100;
      } else if ('assets/images/cellular_bad.png' == img) {
        size = 100;
      }
      final Uint8List markerIcon = await getBytesFromAsset(img, size);
      final MarkerId markerId = MarkerId(office.id);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.lat, office.lng),
        infoWindow: InfoWindow(
          title: office.id,
          snippet: 'add this $size',
        ),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        // icon: BitmapDescriptor.defaultMarker,
        // onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: current,
        zoom: 17,
        //limit zoom in zoom out
      ),
      onMapCreated: _onMapCreated,
      mapType: MapType.terrain,
      markers: Set<Marker>.of(_markers.values),
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      minMaxZoomPreference: const MinMaxZoomPreference(13, 20),
    );
  }
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
  //   void _onMarkerTapped(MarkerId markerId) {
  //   final Marker? tappedMarker = _markers[markerId];
  //   if (tappedMarker != null) {
  //     setState(() {
  //       final MarkerId? previousMarkerId = selectedMarker;
  //       if (previousMarkerId != null && _markers.containsKey(previousMarkerId)) {
  //         final Marker resetOld = _markers[previousMarkerId]!.copyWith(iconParam: BitmapDescriptor.defaultMarker);
  //         _markers[previousMarkerId] = resetOld;
  //       }
  //       selectedMarker = markerId;
  //       final Marker newMarker = tappedMarker.copyWith(
  //         iconParam: BitmapDescriptor.defaultMarkerWithHue(
  //           BitmapDescriptor.hueGreen,
  //         ),
  //       );
  //       _markers[markerId] = newMarker;
  //       // _markerPosition = null;
  //     });
  //   }
  // }