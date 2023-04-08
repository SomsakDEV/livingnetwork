import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

class ModeWarning extends StatefulWidget {
  ModeWarning({
    Key? key,
  }) : super(key: key);

  @override
  State<ModeWarning> createState() => _ModeWarningState();
}

class _ModeWarningState extends State<ModeWarning> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InternalProvider>(
      builder: (context, data, _) {
        return ((data.mode5G?.error ?? false) || data.mode5G?.errorCode != null)
            ? Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: const BoxConstraints(maxHeight: double.infinity),
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
                          warningRepo[data.mode5G?.errorCode ?? '500'],
                          style: LNStyle.warningMessage,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                decoration: const BoxDecoration(
                  color: LNColor.neutralsLightestGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 12,
                        leading: Image.asset(
                          ImageUtils.getImagePath('assets/images/information.png'),
                          width: 20,
                          height: 20,
                        ),
                        title: Text(
                          data.mode5G?.mode == 'max_mode'
                              ? msgDefault
                              : data.mode5G?.mode == 'eco_mode'
                                  ? msgNoTimeout
                                  : (data.mode5G?.mode == 'boost_mode') || (data.mode5G?.mode == 'game_mode')
                                      ? msgAvailableUse
                                      : msgDefault,
                          style: LNStyle.messageDefault,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
