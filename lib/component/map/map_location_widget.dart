import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'dart:ui' as ui;

import 'package:living_network/utility/image_utils.dart';
import 'package:living_network_repository/living_network_repository.dart';
import 'package:provider/provider.dart';

const LatLng current = LatLng(13.731946300000061, 100.56913540000005);

class MapNearByWidget extends StatefulWidget {
  final bool select1, select2;
  const MapNearByWidget(
      {super.key, required this.select1, required this.select2});

  @override
  State<MapNearByWidget> createState() => _MapNearByWidgetState();
}

class _MapNearByWidgetState extends State<MapNearByWidget> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Map<MarkerId, Marker> _markers = {};
  // LatLng? _markerPosition;
  MarkerId? selectedMarker;
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(ImageUtils.getImagePath(path));
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, allowUpscaling: true, targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _getLocations(widget.select1, widget.select2),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.hasData);

          if (snapshot.connectionState == ConnectionState.done) {
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: current,
                zoom: 17,
                //limit zoom in zoom out
              ),
              onMapCreated: (GoogleMapController controller) async {
                _markers.clear();
                print(
                    "################################################################");
              },
              mapType: MapType.terrain,
              markers: Set<Marker>.of(_markers.values),
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              minMaxZoomPreference: const MinMaxZoomPreference(13, 20),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: LNColor.kellyGreen500,
              ),
            );
          }
        });
  }

  Future<void> prepareMarkerShop(
      LocationShop appstate, Uint8List markerIcon) async {
    for (final office in appstate.features) {
      int size = 200;
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
      // setState(() {
      _markers[markerId] = marker;
      // });
    }
  }

  Future<void> prepareMarkerWifi(
      LocationWifi appstate, Uint8List markerIcon) async {
    for (final office in appstate.features) {
      int size = 200;
      final MarkerId markerId =
          MarkerId('${office.properties.slmServiceAreaCode}');
      final marker = Marker(
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
      // setState(() {
      _markers[markerId] = marker;
      // });
    }
  }

  Future<bool> _getLocations(bool select1, bool select2) async {
    LocationShop? shop =
        Provider.of<LnProvider>(context, listen: false).locationShop;
    LocationWifi? wifi =
        Provider.of<LnProvider>(context, listen: false).locationWifi;

    String img_shop = 'assets/images/ais_shop.png';
    String img_wifi = 'assets/images/bit_wifi.png';

    final Uint8List markerIconShop = await getBytesFromAsset(img_shop, 100);
    final Uint8List markerIconWifi = await getBytesFromAsset(img_wifi, 100);

    if (widget.select1) {
      await prepareMarkerShop(shop!, markerIconShop);
    }
    if (widget.select2) {
      await prepareMarkerWifi(wifi!, markerIconWifi);
    }
    return true;
  }
}
