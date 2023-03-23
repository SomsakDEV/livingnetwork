import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:living_network/model/map/location_nearby.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/domain/entities/location_shop.dart';
import 'package:living_network_repository/domain/entities/location_wifi.dart';
import 'package:provider/provider.dart';



class ListPlaceDetail extends StatefulWidget {
  final bool select1, select2;
  const ListPlaceDetail({
    super.key,
    required this.select1,
    required this.select2,
  });
  @override
  State<ListPlaceDetail> createState() => _ListPlaceDetailState();
}

class _ListPlaceDetailState extends State<ListPlaceDetail> {
  double testval = 0;
  late AssetImage shop_img =
      AssetImage(ImageUtils.getImagePath('assets/images/ais_shop.png'));
  late AssetImage wifi_img =
      AssetImage(ImageUtils.getImagePath('assets/images/ais_wifi.png'));

  Future<List<LocationNearBy>> _getItems(bool a, bool b) async {
    List<LocationNearBy> signal_list = [];
    DisplayScreen? appstate = Provider.of<LnProvider>(context, listen: false).displayScreen;

    if (a && b) {
      for (Feature data in appstate!.locationShop!.features) {
        signal_list.add(LocationNearBy(
            id: "${data.properties.ccsmLocationCode}",
            name: "${data.properties.ccsmPartnername}",
            imagetype: "shop",
            lat: data.properties.lmLat ?? 0.0,
            lng: data.properties.lmLong ?? 0.0,
            dist: 100));
      }
      for (FeatureShop data in appstate.locationWifi!.features) {
        signal_list.add(LocationNearBy(
            id: "${data.properties.slmServiceAreaCode}",
            name: "${data.properties.lmAmpNamt}",
            imagetype: "wifi",
            lat: data.properties.lmLat ?? 0.0,
            lng: data.properties.lmLong ?? 0.0,
            dist: 100));
      }
    } else {
      if (a) {
        for (Feature data in appstate!.locationShop!.features) {
          signal_list.add(LocationNearBy(
              id: "${data.properties.ccsmLocationCode}",
              name: "${data.properties.ccsmPartnername}",
              imagetype: "shop",
              lat: data.properties.lmLat ?? 0.0,
              lng: data.properties.lmLong ?? 0.0,
              dist: 100));
        }
      } else if (b) {
        for (FeatureShop data in appstate!.locationWifi!.features) {
          signal_list.add(LocationNearBy(
              id: "${data.properties.slmServiceAreaCode}",
              name: "${data.properties.lmAmpNamt}",
              imagetype: "wifi",
              lat: data.properties.lmLat ?? 0.0,
              lng: data.properties.lmLong ?? 0.0,
              dist: 100));
        }
      } else {
        signal_list.clear();
      }
    }
    return signal_list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LocationNearBy>>(
      future: _getItems(widget.select1, widget.select2),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<LocationNearBy> items = snapshot.data!;
          if (items.isEmpty) {
            return Container();
          } else {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                prototypeItem: ListTile(
                  title: Text(items.first.name),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.5,
                          color: LNColor.greyBtnColor,
                        ),
                        image: DecorationImage(
                            image: ((widget.select1 && widget.select2)
                                ? ((items[index].imagetype == "shop")
                                    ? shop_img
                                    : wifi_img)
                                : (widget.select1)
                                    ? shop_img
                                    : (items[index].imagetype == "wifi")
                                        ? wifi_img
                                        : shop_img),
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft),
                      ),
                    ),
                    title: Text(
                      items[index].name,
                      style: const TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      '(${items[index].dist} m)',
                      style: const TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: TextButton(
                      child: const Text(
                        'Direction',
                        style: TextStyle(
                          color: LNColor.kellyGreen500,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/map/direction');
                      },
                    ),
                  );
                },
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return CircularProgressIndicator(
            color: LNColor.kellyGreen500,
          );
        }
      },
    );
  }
}
