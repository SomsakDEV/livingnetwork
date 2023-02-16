// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';

class ListPlaceDetail extends StatefulWidget {
  const ListPlaceDetail({super.key});

  @override
  State<ListPlaceDetail> createState() => _ListPlaceDetailState();
}

class _ListPlaceDetailState extends State<ListPlaceDetail> {
  List<String> items = List<String>.generate(10, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        prototypeItem: ListTile(
          title: Text(items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: UiButton(width: 100, buttonType: ButtonType.secondaryBtn, title: 'lead'),
            title: Text(items[index], style: TextStyle(fontSize: 20)),
            subtitle: Text(items[index], style: TextStyle(fontSize: 10)),
            trailing: TextButton(
              child: Text(
                'click',
                style: TextStyle(
                  color: BaseColors.kellyGreen500,
                  fontSize: 20,
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
