import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/utility/image_utils.dart';

class Mode5GDefault extends StatefulWidget {
  const Mode5GDefault({Key? key}) : super(key: key);

  @override
  State<Mode5GDefault> createState() => _Mode5GDefaultState();
}

class _Mode5GDefaultState extends State<Mode5GDefault> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: LNColor.neutralsLightestGrey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 25.17, bottom: 22.83, right: 16),
            child: Image.asset(
              ImageUtils.getImagePath(
                'assets/images/information.png',
              ),
              height: 20,
              width: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 5.66, right: 15),
            child: Text(
              messageDefault,
              style: LNStyle.messageDefault,
            ),
          ),
        ],
      ),
    );
  }
}
