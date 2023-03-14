import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:living_network/component/problem/problem_card.dart';
import 'package:living_network/constance/LNColor.dart';

class ProblemAlert extends StatefulWidget {
  const ProblemAlert({super.key});

  @override
  State<ProblemAlert> createState() => _ProblemAlertState();
}

int activeIndex = 0;
late double monitorWidth;
late double monitorheigth;

class _ProblemAlertState extends State<ProblemAlert> {
  @override
  Widget build(BuildContext context) {
    monitorWidth = MediaQuery.of(context).size.width;
    monitorheigth = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: monitorheigth * 0.13,
          child: CarouselSlider.builder(
            itemCount: cards.length,
            itemBuilder: (context, index, realIndex) {
              final card = cards[index];
              return buildCard(card, index);
            },
            options: CarouselOptions(
              height: monitorheigth,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) => setState(() => activeIndex = index),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cards.length, (index) => buildIndicator(context, index)),
        ),
      ],
    );
    // },
    // );
  }
}

List<Widget> cards = [
  CardAlert(
    text: 'Unable to use 5G mode because you have turned off cellular 5G. Please check your setting menu on your phone',
  ),
  CardAlert(
    text: 'ขณะนี้ Facebook และ Instagram กำลังมีปัญหาทั่วโลกทำให้การเชื่อมต่อโซเชียลมีปัญหา โปรดรอสักครู่ 🥲...',
  ),
  CardAlert(
    text: 'ขณะนี้สัญญาณมีปัญหาจะกลับมาใช้งานภาย ใน 60 นาทีคุณสามารถเชื่อมต่อ Super WiFi ฟรี ในพื้นที่ใกล้เคียงได้',
    color: LNColor.bgGreen,
    style: true,
  ),
];

Widget buildCard(Widget card, int index) => SizedBox(
      width: monitorWidth,
      child: card,
    );

Widget buildIndicator(BuildContext context, int index) => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      width: activeIndex == index ? monitorWidth * 0.09 : monitorWidth * 0.024,
      decoration: BoxDecoration(color: index == activeIndex ? LNColor.verticalDivider : LNColor.inActive, borderRadius: BorderRadius.circular(5)),
    );
