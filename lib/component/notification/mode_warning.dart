import 'package:flutter/material.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';

class ModeWarning extends StatefulWidget {
  final String warningText;

  ModeWarning({
    Key? key,
    required this.warningText,
  }) : super(key: key);

  @override
  State<ModeWarning> createState() => _ModeWarningState();
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
                widget.warningText,
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
