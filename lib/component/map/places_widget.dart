import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/model/map/location_nearby.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
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

  Future<List<LocationNearBy>> _getItems(bool selectShop, bool selectWifi) async {
    List<LocationNearBy> signal_list = [];
    LocationShop? locationShop =
        Provider.of<InternalProvider>(context, listen: false).locationShop;

    LocationWifi? locationWifi =
        Provider.of<InternalProvider>(context, listen: false).locationWifi;

    String? markerTab =
        Provider.of<InternalProvider>(context, listen: true).markerTab;

    if (selectShop && selectWifi) {
      for (Feature data in locationShop!.features) {
        signal_list.add(LocationNearBy(
            id: "${data.properties.ccsmLocationCode}",
            name: "${data.properties.ccsmPartnername}",
            imagetype: "shop",
            lat: data.properties.lmLat ?? 0.0,
            lng: data.properties.lmLong ?? 0.0,
            dist: 100));
      }
      for (FeatureShop data in locationWifi!.features) {
        signal_list.add(LocationNearBy(
            id: "${data.properties.slmSiteApSsidId}",
            name: "${data.properties.lmAmpNamt}",
            imagetype: "wifi",
            lat: data.properties.lmLat ?? 0.0,
            lng: data.properties.lmLong ?? 0.0,
            dist: 100));
      }
    } else {
      if (selectShop) {
        for (Feature data in locationShop!.features) {
          signal_list.add(LocationNearBy(
              id: "${data.properties.ccsmLocationCode}",
              name: "${data.properties.ccsmPartnername}",
              imagetype: "shop",
              lat: data.properties.lmLat ?? 0.0,
              lng: data.properties.lmLong ?? 0.0,
              dist: 100));
        }
      } else if (selectWifi) {
        for (FeatureShop data in locationWifi!.features) {
          signal_list.add(LocationNearBy(
              id: "${data.properties.slmSiteApSsidId}",
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

    if (markerTab != null) {
      return modifyList(markerTab, signal_list);
    } else {
      return signal_list;
    }
  }

  List<LocationNearBy> modifyList(String input, List<LocationNearBy> list) {
    List<LocationNearBy> list_copy = List.from(list);

    LocationNearBy item = list.singleWhere((it) => it.id == input , orElse: () => LocationNearBy(id: 'null', name: 'null', imagetype: 'null', lat: 0.0, lng: 0.0, dist: 0));

    if (item.id == 'null') {
      return list;
    }
    print(item);
    print(item.id);
    print(item.name);
    list_copy.remove(item);
    list_copy.insert(0, item);
    print(list_copy[0].id);
    return list_copy;
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
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0), // Set the desired padding values
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
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
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
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
