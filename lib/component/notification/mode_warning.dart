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
                          warningRepo[data.mode5G?.errorCode ?? '500'],
                          style: LNStyle.warningMessage,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 52,
                decoration: const BoxDecoration(
                  color: LNColor.neutralsLightestGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 25.17, bottom: 22.83, right: 16),
                      child: Image.asset(
                        ImageUtils.getImagePath('assets/images/information.png'),
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.mode5G?.mode == 'max_mode'
                            ? msgDefault
                            : data.mode5G?.mode == 'eco_mode'
                                ? msgNoTimeout
                                : (data.mode5G?.mode == 'boost_mode') || (data.mode5G?.mode == 'game_mode')
                                    ? msgAvailableUse
                                    : msgDefault,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: LNStyle.messageDefault,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
