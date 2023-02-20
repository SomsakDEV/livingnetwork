// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';

class ListPlaceDetail extends StatefulWidget {
  bool select1, select2;
  ListPlaceDetail({
    super.key,
    required this.select1,
    required this.select2,
  });

  @override
  State<ListPlaceDetail> createState() => _ListPlaceDetailState();
}

class _ListPlaceDetailState extends State<ListPlaceDetail> {
  List<String> items = List.empty();
  double testval = 0;
  late AssetImage shop_img = AssetImage('packages/living_network/assets/images/ais_shop.png');
  late AssetImage wifi_img = AssetImage('packages/living_network/assets/images/ais_wifi.png');

  _getItems(bool a, bool b) {
    int val = (a && b) ? 10 : ((a || b) ? 5 : 0);
    String shop = 'AIS Shop';
    String wifi = 'Super Wifi';

    items = List<String>.generate(
        (val),
        (i) => (a && b)
            ? ((i % 2 == 0) ? '$shop $i' : '$wifi $i')
            : (a)
                ? '$shop $i'
                : '$wifi $i');
  }

  @override
  Widget build(BuildContext context) {
    _getItems(widget.select1, widget.select2);
    if (items.isEmpty) {
      return Container();
    } else {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
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
                    color: BaseColors.greyBtnColor,
                  ),
                  image: DecorationImage(
                      image: ((widget.select1 && widget.select2)
                          ? ((index % 2 == 0) ? shop_img : wifi_img)
                          : (widget.select1)
                              ? shop_img
                              : wifi_img),
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft),
                ),
              ),
              title: Text(
                items[index],
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                '(${index * 100} m)',
                style: TextStyle(
                  color: Color(0xFF9D9D9D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: TextButton(
                child: const Text(
                  'Direction',
                  style: TextStyle(
                    color: BaseColors.kellyGreen500,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {},
              ),
            );
          },
        ),
      );
    }
  }
}
