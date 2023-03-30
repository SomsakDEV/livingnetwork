import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/model/map/grid_location.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/provider/map_location_provider.dart';
import 'dart:ui' as ui;

import 'package:living_network/utility/image_utils.dart';
import 'package:living_network_repository/living_network_repository.dart';
import 'package:provider/provider.dart';

const LatLng current = LatLng(13.731946300000061, 100.56913540000005);
// const LatLng current = LatLng(13.717417000000069, 100.41941700000007);


class MapNearByWidget extends StatefulWidget {
  final bool select1, select2;
  const MapNearByWidget(
      {super.key, required this.select1, required this.select2});

  @override
  State<MapNearByWidget> createState() => _MapNearByWidgetState();
}

class _MapNearByWidgetState extends State<MapNearByWidget> {
  late GoogleMapController mapController;
  final Map<MarkerId, Marker> _markers = {};

  final Set<Polygon> _polygon = HashSet<Polygon>();

  // late MapLocationProvider mapLocationState;
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

  BitmapDescriptor iconShop = BitmapDescriptor.defaultMarker;
  BitmapDescriptor iconWifi = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            'assets/images/ais_shop.png')
        .then((onValue) {
      iconShop = onValue;
    });

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            'assets/images/bit_wifi.png')
        .then((onValue) {
      iconWifi = onValue;
    });
  }

  @override
  void didUpdateWidget(MapNearByWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _markers.clear();

    if (widget.select1) {
      prepareDataShop();
    }

    if (widget.select2) {
      prepareDataWifi();
    }
  }

  void prepareDataShop() {
    for (final office in getlocationShop()!.features) {
      String img = 'assets/images/ais_shop.png';
      int size = 200;
      if ('assets/images/cellular_other.png' == img) {
        size = 100;
      } else if ('assets/images/cellular_bad.png' == img) {
        size = 100;
      }
      // final Uint8List markerIcon = await getBytesFromAsset(img, size);
      final MarkerId markerId =
          MarkerId('${office.properties.ccsmLocationCode}');
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.properties.lmLat!.toDouble(),
            office.properties.lmLong!.toDouble()),
        infoWindow: InfoWindow(
          title: '${office.properties.lmAmpName}',
          snippet: 'add this $size',
        ),
        // icon: BitmapDescriptor.fromBytes(markerIcon),
        // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, Image.asset('assets/images/ais_shop.png')).then((value) => value)
        // icon: BitmapDescriptor.defaultMarker,
        icon: iconShop,
        onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  void prepareDataWifi() {
    for (final office in getlocationWifi()!.features) {
      String img = 'assets/images/bit_wifi.png';
      int size = 200;
      if ('assets/images/cellular_other.png' == img) {
        size = 100;
      } else if ('assets/images/cellular_bad.png' == img) {
        size = 100;
      }
      // final Uint8List markerIcon = await getBytesFromAsset(img, size);
      final MarkerId markerId =
          MarkerId('${office.properties.slmSiteApSsidId}');
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.properties.lmLat!.toDouble(),
            office.properties.lmLong!.toDouble()),
        infoWindow: InfoWindow(
          title: '${office.properties.lmAmpName}',
          snippet: 'add this $size',
        ),
        // icon: BitmapDescriptor.fromBytes(markerIcon),
        // icon: BitmapDescriptor.defaultMarker,
        icon: iconWifi,
        onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  LocationShop? getlocationShop() {
    LocationShop? shop =
        Provider.of<LnProvider>(context, listen: false).locationShop;
    return shop;
  }

  LocationWifi? getlocationWifi() {
    LocationWifi? wifi =
        Provider.of<LnProvider>(context, listen: false).locationWifi;
    return wifi;
  }

  void _onMarkerTapped(MarkerId markerId) {
    Provider.of<MapLocationProvider>(context, listen: false)
        .updateMarkerTab(markerId.value);
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    print("################################################################");
    _markers.clear();

    if (widget.select1) {
      prepareDataShop();
    }

    if (widget.select2) {
      prepareDataWifi();
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
      polygons: _polygon,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      minMaxZoomPreference: const MinMaxZoomPreference(13, 20),
    );
  }
}
