import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:flutter/material.dart';
import 'package:living_network/utility/constants.dart';

class UiBottomSheetCardDialogTextMode extends StatefulWidget {
  const UiBottomSheetCardDialogTextMode({
    Key? key,
  }) : super(key: key);

  @override
  State<UiBottomSheetCardDialogTextMode> createState() => _UiBottomSheetCardDialogTextModeState();
}

class _UiBottomSheetCardDialogTextModeState extends State<UiBottomSheetCardDialogTextMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      // height: widget.imagePath == null ? 386 : 455,
      // height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                // decoration: ,
                color: BaseColorsLN.neutralsWhiteMixGrey,
                child: ListTile(
                  leading: image[index],
                  title: Text(
                    title[index],
                    style: LNBaseTextStyle.uiBottomSheetTextTitle,
                  ),
                  subtitle: Text(
                    subTitle[index],
                    style: LNBaseTextStyle.uiBottomSheetTextDesc,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // child: Padding(
      //   padding: EdgeInsets.only(
      //       top: 50.0,
      //       bottom: MediaQuery.of(context).size.height * 0.053,
      //       left: 16.0,
      //       right: 16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(
      //         widget.titleMax,
      //         style: const TextStyle(
      //           color: BaseColors.kellyGreen500,
      //           fontSize: 32,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(left: 18.0, top: 8, right: 18.0),
      //         child: Text(
      //           textAlign: TextAlign.center,
      //           widget.descMax,
      //           maxLines: 2,
      //           overflow: TextOverflow.ellipsis,
      //           style: const TextStyle(
      //             fontSize: 22,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: widget.imageMax == null
      //             ? const SizedBox(height: 45)
      //             : Padding(
      //                 padding:
      //                     const EdgeInsets.only(top: 24.0, bottom: 33),
      //                 child: Image.asset(
      //                   widget.imageMax!,
      //                   fit: BoxFit.fill,
      //                   height: 72,
      //                   width: 72,
      //                 ),
      //               ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
