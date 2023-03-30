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

const LatLng current = LatLng(13.783681327551925, 100.54645268209386);
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
            const ImageConfiguration(size: Size(36, 36)),
            'assets/images/bit_shop.png')
        .then((onValue) {
      iconShop = onValue;
    });

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(36, 36)),
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
          title: '${office.properties.slmApLocation}',
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
    _polygon.clear();

    // GridLocation gridLocation = await getGridLocation();
    String data_json =
    await rootBundle.loadString('assets/data/mockdata_pt_ssn.json');
    GridLocation gridLocation = GridLocation.fromJson(json.decode(data_json));
    double diff = 0.0004999999999881766;
    double benchmark_max = 0;

    for (final features_data in gridLocation.features) {
      List<List<List<double>>> coordinates = features_data.geometry.coordinates;
      if (coordinates[0][4][1] > benchmark_max) {
        benchmark_max = coordinates[0][4][1];
      }
    }

    for (final features_data in gridLocation.features) {
      List<List<List<double>>> coordinates = features_data.geometry.coordinates;
      double diff_layer = benchmark_max - coordinates[0][1][1];
      int layer_num = (diff_layer / diff).toInt();
      final width_cal_slide =
          (coordinates[0][0][1] - coordinates[0][2][1]).abs() / 2;
      double slide_up = width_cal_slide - (width_cal_slide / 2);

      if (layer_num % 2 == 0 && layer_num != 0) {
        coordinates[0][0][0] = coordinates[0][0][0] - (diff / 2);
        coordinates[0][1][0] = coordinates[0][1][0] - (diff / 2);
        coordinates[0][2][0] = coordinates[0][2][0] - (diff / 2);
        coordinates[0][3][0] = coordinates[0][3][0] - (diff / 2);
        coordinates[0][4][0] = coordinates[0][4][0] - (diff / 2);
      }

      coordinates[0][0][1] =
          coordinates[0][0][1] + ((layer_num - 1) * slide_up);
      coordinates[0][1][1] =
          coordinates[0][1][1] + ((layer_num - 1) * slide_up);
      coordinates[0][2][1] =
          coordinates[0][2][1] + ((layer_num - 1) * slide_up);
      coordinates[0][3][1] =
          coordinates[0][3][1] + ((layer_num - 1) * slide_up);
      coordinates[0][4][1] =
          coordinates[0][4][1] + ((layer_num - 1) * slide_up);

      // Calculate the center point of the rectangle
      // if (coordinates[0][4][1] == benchmark_max) {}

      final centerLat = (coordinates[0][1][1] + coordinates[0][3][1]) / 2; //x
      final centerLng = (coordinates[0][1][0] + coordinates[0][2][0]) / 2; //y
      final center = LatLng(centerLat, centerLng);

      final width = (coordinates[0][0][1] - coordinates[0][2][1]).abs() / 2;
      // final height2 = math.sqrt(3) * width;

      final hexagonPoints = [
        LatLng(centerLat - (width), centerLng),
        LatLng(centerLat - (width / 2), centerLng + width),
        LatLng(centerLat + (width / 2), centerLng + width),
        LatLng(centerLat + (width), centerLng),
        LatLng(centerLat + (width / 2), centerLng - width),
        LatLng(centerLat - (width / 2), centerLng - width),
      ];

      _polygon.add(Polygon(
        polygonId: PolygonId('${features_data.id}'),
        points: hexagonPoints,
        // given color to polygon
        fillColor: Color.fromARGB(255, 175, 231, 104).withOpacity(0.4),
        // given border color to polygon
        strokeColor: Color.fromARGB(255, 253, 253, 253).withOpacity(0.4),
        geodesic: true,
        // given width of border
        strokeWidth: 2,
      ));
    }


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
      scrollGesturesEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      minMaxZoomPreference: const MinMaxZoomPreference(17, 20),
    );
  }
}
