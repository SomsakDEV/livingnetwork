import 'package:flutter/material.dart';
import 'package:living_network/component/problem/problem_info.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';

class CardAlert extends StatefulWidget {
  const CardAlert({
    super.key,
    this.color,
    this.text,
    this.style,
  });

  final Color? color;
  final String? text;
  final bool? style;

  @override
  State<CardAlert> createState() => _CardAlertState();
}

class _CardAlertState extends State<CardAlert> {
  @override
  Widget build(BuildContext context) {
    double monitorWidth = MediaQuery.of(context).size.width;
    return Card(
      color: widget.color ?? BaseColorsLN.bgProblem,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 10, top: 9),
                    child: Image.asset(
                      widget.style == true ? ImageUtils.getImagePath('assets/images/warning_green.png') : ImageUtils.getImagePath('assets/images/warning.png'),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: monitorWidth * 0.746,
                    child: Text(
                      widget.text ?? 'ขณะนี้บริเวณที่คุณอยู่มีผู้ใช้งานสัญญาณอินเทอร์เน็ตค่อนข้างหนาแน่น ขออภัยในความไม่สะดวก',
                      style: widget.style == true ? LNStyle.body2_1 : LNStyle.warningMessage,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: widget.style == true ? monitorWidth * 0.34 : 82,
                  height: widget.style == true ? monitorWidth * 0.07 : 35,
                  child: widget.style == true
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BaseColorsLN.kellyGreen500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                width: 1,
                                color: BaseColorsLN.kellyGreen500,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Free WIFI near you",
                            style: LNStyle.freeWifiButton,
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProblemInfo()),
                            );
                          },
                          style: ButtonStyle(
                            alignment: Alignment.centerRight,
                            overlayColor: MaterialStateProperty.all(BaseColorsLN.buttonOverlay),
                          ),
                          child: Flexible(
                            child: Row(
                              children: const [
                                Text(
                                  'ดูเพิ่มเติม',
                                  style: LNStyle.body2_1,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
