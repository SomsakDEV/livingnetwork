import 'package:flutter/material.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/utility/image_utils.dart';

class ModeWarning extends StatefulWidget {
  final int warningNumber;

  const ModeWarning({
    Key? key,
    required this.warningNumber,
  }) : super(key: key);

  @override
  State<ModeWarning> createState() => _ModeWarningState();
}

int num = 1;

String conditionShowMessage(int num) {
  switch (num) {
    case 1:
      return warning1;
    case 2:
      return warning2;
    case 3:
      return warning3;
    case 31:
      return warning3_1;
    case 4:
      return warning4;
    case 41:
      return warning4_1;
    case 6:
      return warning6;
    case 8:
      return warning8;
    case 8:
      return warning9;
    case 10:
      return warning10;
    case 11:
      return warning10;
    case 12:
      return warningTimeout;
    case 13:
      return not5GMode;
    case 14:
      return warningCheck5GError;
  }
  return "no message";
}

class _ModeWarningState extends State<ModeWarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 52,
      decoration: const BoxDecoration(
        color: Color(0x66FFE9BD),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              minLeadingWidth: 12,
              leading: Image.asset(
                ImageUtils.getImagePath('assets/images/warning.png'),
                width: 20,
                height: 20,
              ),
              title: Text(
                conditionShowMessage(widget.warningNumber),
                style: LNStyle.warningMessage,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
