import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:living_network/model/map/locations.dart' as locations;
import 'package:living_network/model/map/signal_nearby.dart' as signal_nearby;
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network_repository/domain/entities/location_shop.dart';
import 'package:provider/provider.dart';

import '../../model/map/signal_nearby.dart';

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
  var appstate;
  late AssetImage shop_img =
      AssetImage(ImageUtils.getImagePath('assets/images/ais_shop.png'));
  late AssetImage wifi_img =
      AssetImage(ImageUtils.getImagePath('assets/images/ais_wifi.png'));

  Future<List<Feature>> _getItems(bool a, bool b) async {
    List<Feature> signal_list = [];

    if (a && b) {
      signal_list = appstate.locationShop!.features;
      signal_list.addAll(appstate.locationWifi!.features);
    } else {
      if (a) {
        signal_list = appstate.locationShop!.features;

        // for (final test in appstate.locationShop!.features) {
        //   print("?????????????????????");

        //   print(test.properties.lmProvNamt);
        //   print("?????????????????????");

        //   // signal_list = await signal_nearby.getSignalNearByShop();
        // }
      } else if (b) {
        signal_list = appstate.locationWifi!.features;

        // signal_list = await signal_nearby.getSignalNearByWifi();
      } else {
        signal_list.clear();
      }
    }
    // for (var item in signal_list) {
    //   print(item);
    //   // Do something with index and item
    // }
    for (var item in signal_list) {
      print(item.properties.ccsmLocationCode);
    }
    return signal_list;
  }

  @override
  Widget build(BuildContext context) {
    appstate = context.watch<LnProvider>();

    return FutureBuilder<List<Feature>>(
      future: _getItems(widget.select1, widget.select2),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Feature> items = snapshot.data!;
          print("*************************************");
          print(items[0].properties);
          print("*************************************");

          if (items.isEmpty) {
            return Container();
          } else {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                prototypeItem: ListTile(
                  title: Text(items.first.id),
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
                      items[index].id,
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

                        // print(
                        //     ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        // print(items[index].id);
                        // print(context);
                        // print(
                        //     ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        // String itemId = items[index].id;
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
