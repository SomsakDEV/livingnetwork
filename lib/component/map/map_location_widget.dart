import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:living_network/model/map/grid_location.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

const LatLng current = LatLng(13.783681327551925, 100.54645268209386);

class MapNearByWidget extends StatefulWidget {
  final bool select1, select2;

  const MapNearByWidget({super.key, required this.select1, required this.select2});

  @override
  State<MapNearByWidget> createState() => _MapNearByWidgetState();
}

class _MapNearByWidgetState extends State<MapNearByWidget> {
  late GoogleMapController mapController;
  final Map<MarkerId, Marker> _markers = {};
  final Set<Polygon> _polygon = HashSet<Polygon>();
  MarkerId? selectedMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(ImageUtils.getImagePath(path));
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width, allowUpscaling: true, targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  BitmapDescriptor iconShop = BitmapDescriptor.defaultMarker;
  BitmapDescriptor iconWifi = BitmapDescriptor.defaultMarker;

  Future<void> _loadMarker() async {
    final Uint8List shop = await getBytesFromAsset('assets/images/bit_shop.png', 100);
    final Uint8List wifi = await getBytesFromAsset('assets/images/bit_wifi.png', 100);
    iconShop = BitmapDescriptor.fromBytes(shop);
    iconWifi = BitmapDescriptor.fromBytes(wifi);
  }

  @override
  void initState() {
    _loadMarker();
    super.initState();
  }

  @override
  void didUpdateWidget(MapNearByWidget oldWidget) {
    _markers.clear();
    if (widget.select1) {
      prepareDataShop();
    }
    if (widget.select2) {
      prepareDataWifi();
    }
    super.didUpdateWidget(oldWidget);
  }

  void prepareDataShop() async {
    var list = Provider.of<InternalProvider>(context, listen: false).locationShop?.features ?? [];
    for (final office in list) {
      final MarkerId markerId = MarkerId('${office.properties.ccsmLocationCode}');
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.properties.lmLat ?? 0, office.properties.lmLong ?? 0),
        infoWindow: InfoWindow(
          title: '${office.properties.lmAmpName}',
          snippet: 'AISShop',
        ),
        icon: iconShop,
        onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  void prepareDataWifi() async {
    var list = Provider.of<InternalProvider>(context, listen: false).locationWifi?.features ?? [];
    for (final office in list) {
      final MarkerId markerId = MarkerId('${office.properties.slmSiteApSsidId}');
      final marker = Marker(
        markerId: markerId,
        position: LatLng(office.properties.lmLat ?? 0, office.properties.lmLong ?? 0),
        infoWindow: InfoWindow(
          title: '${office.properties.slmApLocation}',
          snippet: 'Super Wifi',
        ),
        icon: iconWifi,
        onTap: () => _onMarkerTapped(markerId),
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  void _onMarkerTapped(MarkerId markerId) {
    Provider.of<InternalProvider>(context, listen: false).updateMarkerTab(markerId.value);
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    _polygon.clear();

    // GridLocation gridLocation = await getGridLocation();
    String data_json = await rootBundle.loadString('assets/data/800m_aisbuild1.json');
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
      final width_cal_slide = (coordinates[0][0][1] - coordinates[0][2][1]).abs() / 2;
      double slide_up = width_cal_slide - (width_cal_slide / 2);

      if (layer_num % 2 == 0 && layer_num != 0) {
        coordinates[0][0][0] = coordinates[0][0][0] - (diff / 2);
        coordinates[0][1][0] = coordinates[0][1][0] - (diff / 2);
        coordinates[0][2][0] = coordinates[0][2][0] - (diff / 2);
        coordinates[0][3][0] = coordinates[0][3][0] - (diff / 2);
        coordinates[0][4][0] = coordinates[0][4][0] - (diff / 2);
      }

      coordinates[0][0][1] = coordinates[0][0][1] + ((layer_num - 1) * slide_up);
      coordinates[0][1][1] = coordinates[0][1][1] + ((layer_num - 1) * slide_up);
      coordinates[0][2][1] = coordinates[0][2][1] + ((layer_num - 1) * slide_up);
      coordinates[0][3][1] = coordinates[0][3][1] + ((layer_num - 1) * slide_up);
      coordinates[0][4][1] = coordinates[0][4][1] + ((layer_num - 1) * slide_up);

      // Calculate the center point of the rectangle
      // if (coordinates[0][4][1] == benchmark_max) {}

      final centerLat = (coordinates[0][1][1] + coordinates[0][3][1]) / 2; //x
      final centerLng = (coordinates[0][1][0] + coordinates[0][2][0]) / 2; //y
      // final center = LatLng(centerLat, centerLng);

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
