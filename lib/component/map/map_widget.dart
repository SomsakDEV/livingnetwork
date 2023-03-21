import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'dart:ui' as ui;

import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

const LatLng current = LatLng(13.731946300000061, 100.56913540000005);

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Map<MarkerId, Marker> _markers = {};
  // LatLng? _markerPosition;
  MarkerId? selectedMarker;
  // var appstate;
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(ImageUtils.getImagePath(path));
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, allowUpscaling: true, targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // print(appstate.locationShop?.features[0].properties.lmLat);

    // final googleOffices = await locations.getGoogleOffices();

    // _markers.clear();
    // for (final office in appstate.locationShop!.features) {
    //   String img = 'assets/images/ais_shop.png';
    //   int size = 200;
    //   if ('assets/images/cellular_other.png' == img) {
    //     size = 100;
    //   } else if ('assets/images/cellular_bad.png' == img) {
    //     size = 100;
    //   }
    //   final Uint8List markerIcon = await getBytesFromAsset(img, size);
    //   final MarkerId markerId =
    //       MarkerId('${office.properties.ccsmLocationCode}');
    //   final marker = Marker(
    //     markerId: markerId,
    //     position: LatLng(office.properties.lmLat!.toDouble(),
    //         office.properties.lmLong!.toDouble()),
    //     infoWindow: InfoWindow(
    //       title: '${office.properties.ccsmLocationCode}',
    //       snippet: 'add this $size',
    //     ),
    //     icon: BitmapDescriptor.fromBytes(markerIcon),
    //     // icon: BitmapDescriptor.defaultMarker,        // onTap: () => _onMarkerTapped(markerId),
    //   );
    //   setState(() {
    //     _markers[markerId] = marker;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<LnProvider>();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // print(widget.select1! ? "Hi" : "Lo");
    // print(context.watch<LnProvider>().locationShop?.features.length);
    // print(context.watch<LnProvider>().locationWifi?.features.length);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: current,
        zoom: 17,
        //limit zoom in zoom out
      ),
      onMapCreated: (GoogleMapController controller) async {
        _markers.clear();
        await prepareMarkerShop(appstate);
        await prepareMarkerWifi(appstate);

        _controller.complete(controller);
      },
      mapType: MapType.terrain,
      markers: Set<Marker>.of(_markers.values),
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      minMaxZoomPreference: const MinMaxZoomPreference(13, 20),
    );
  }

  Future<void> prepareMarkerShop(LnProvider appstate) async {
    for (final office in appstate.locationShop!.features) {
      String img = 'assets/images/ais_shop.png';
      int size = 200;
      if ('assets/images/cellular_other.png' == img) {
        size = 100;
      } else if ('assets/images/cellular_bad.png' == img) {
        size = 100;
      }
      final Uint8List markerIcon = await getBytesFromAsset(img, size);
      final MarkerId markerId =
          MarkerId('${office.properties.ccsmLocationCode}');
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.properties.lmLat!.toDouble(),
            office.properties.lmLong!.toDouble()),
        infoWindow: InfoWindow(
          title: '${office.properties.ccsmLocationCode}',
          snippet: 'add this $size',
        ),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        // icon: BitmapDescriptor.defaultMarker,
        //// onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  Future<void> prepareMarkerWifi(LnProvider appstate) async {
    for (final office in appstate.locationWifi!.features) {
      String img = 'assets/images/bit_wifi.png';
      int size = 200;
      if ('assets/images/cellular_other.png' == img) {
        size = 100;
      } else if ('assets/images/cellular_bad.png' == img) {
        size = 100;
      }
      final Uint8List markerIcon = await getBytesFromAsset(img, size);
      final MarkerId markerId =
          MarkerId('${office.properties.slmServiceAreaCode}');
      final marker = Marker(
        onTap: () {
          print(markerId);
        },
        markerId: markerId,
        position: LatLng(office.properties.lmLat!.toDouble(),
            office.properties.lmLong!.toDouble()),
        infoWindow: InfoWindow(
          title: '${office.properties.lmAmpName}',
          snippet: 'add this $size',
        ),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        // icon: BitmapDescriptor.defaultMarker,
        //// onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }
}
