import 'package:flutter/material.dart';

class LNColor {
  LNColor._();

  static const primaryColor = Color(0xFF73C23A); // change to kellyGreen500
  static const secondaryColor = Color(0xFF25584F); // change to musGreen800
  static const green900Color = Color(0xFF1E3D35); // change to musGreen900
  static const primaryColor100 = Color(0xFFD6EDC5); // change to kellyGreen100
  static const primaryColor50 = Color(0xFFEEF8E8); // change to kellyGreen50 or alertSuccess800
  static const textGreenColor = Color(0xFF1E3D35); // change to musGreen900
  static const greyTextColor = Color(0xFF555555); // change to neutralsBoldGrey
  static const successColor = Color(0xFF3A8A1F); // change to kellyGreen800
  static const warningColor = Color(0xFFFF8D00); // change to alertWarning800
  static const serenadeColor500 = Color(0xFFEBCD78); // change to seranade500
  static const failColor = Color(0xFFE32C14); // change to alertError800
  static const bgToastColor = Color(0xFF262626); // change to neutralsDarkestGrey
  static const greyColor = Color(0xFFD9D9D9); // change to neutralsGrey
  static const greyBtnColor = Color(0xFF9D9D9D); // change to neutralsMediumGrey

  static const whiteColor = Color(0xFFFFFFFF); // change to neutralsWhite
  static const blackColor = Color(0xFF000000); // change to neutralsBlack

  static const lightGrey = Color(0xFFE9E9E9); // change to neutralsLightGrey
  static const lightestGrey = Color(0xFFF5F5F5); // change to neutralsLightestGrey
  static const darkestGrey = Color(0xFF262626); // change to neutralsDarkestGrey

  static const transparent = Color.fromARGB(0, 255, 255, 255);
  static const translucent = Color.fromARGB(0, 0, 0, 0);
  static const greenColor700 = Color(0xFF64CA00);
  static const greenColor100 = Color(0xFFF1FFF1);
  static const mintColor = Color(0xFF169770);
  static const lightestGreyA40 = Color(0x66F5F5F5);
  static const greyBlue = Color(0xFF38454C);
  static const greenDark1A = Color(0x1A64CA00);
  static const blackColorA40 = Color(0x66000000);
  static const textColorTabBar = Color(0xFF657884);
  static const verticalDivider = Color(0xFFB0BEC5);
  static const greenColor10 = Color(0xFF9EDE3E);
  static const greenColor20 = Color(0xFF64CA00);
  static const greenColorClose = Color(0xFF5FBB1C);
  static const whiteSpeedCompare = Color(0xFFF2F4F6);
  static const blackGrey80percent = Color(0xCC262626);

  // below code is new base colors

  // Neutrals
  static const neutralsWhite = Color(0xFFFFFFFF);
  static const neutralsWhite10 = Color(0xFFF0F0F0);
  static const neutralsWhiteMixGrey = Color(0xFFFAFAFA);
  static const neutralsLightestGrey = Color(0xFFF5F5F5);
  static const neutralsLightGrey = Color(0xFFE9E9E9);
  static const neutralsGrey = Color(0xFFD9D9D9);
  static const neutralsMediumGrey = Color(0xFF9D9D9D);
  static const neutralsDarkGrey = Color(0xFF7B7B7B);
  static const neutralsBoldGrey = Color(0xFF555555);
  static const neutralsGrey800 = Color(0xFF586A74);
  static const neutralsDarkestGrey = Color(0xFF262626);
  static const neutralsBlack = Color(0xFF000000);
  static const neutralsBlackSixtyPercent = Color(0x99000000);
  static const neutralLightGrey = Color(0xFF7B8E98);

  // Kelly Green
  static const kellyGreen50 = Color(0xFFEEF8E8);
  static const kellyGreen100 = Color(0xFFD6EDC5);
  static const kellyGreen200 = Color(0xFFBAE19F);
  static const kellyGreen300 = Color(0xFF9ED478);
  static const kellyGreen400 = Color(0xFF88CB59);
  static const kellyGreen500 = Color(0xFF73C23A);
  static const kellyGreen600 = Color(0xFF64B232);
  static const kellyGreen700 = Color(0xFF4F9E28);
  static const kellyGreen800 = Color(0xFF3A8A1F);
  static const kellyGreen900 = Color(0xFF08680A);

  // MUS Green
  static const musGreen50 = Color(0xFFE0EFEE);
  static const musGreen100 = Color(0xFFB3D9D5);
  static const musGreen200 = Color(0xFF84C0BA);
  static const musGreen300 = Color(0xFF58A89F);
  static const musGreen400 = Color(0xFF3F968B);
  static const musGreen500 = Color(0xFF318478);
  static const musGreen600 = Color(0xFF2D786C);
  static const musGreen700 = Color(0xFF29685D);
  static const musGreen800 = Color(0xFF25584F);
  static const musGreen900 = Color(0xFF1E3D35);

  // Bitter Lime
  static const bitterLime50 = Color(0xFFF8FFE7);
  static const bitterLime100 = Color(0xFFEEFEC2);
  static const bitterLime200 = Color(0xFFE1FE98);
  static const bitterLime300 = Color(0xFFD4FD6A);
  static const bitterLime400 = Color(0xFFCBFD43);
  static const bitterLime500 = Color(0xFFC1FA00);
  static const bitterLime600 = Color(0xFFB8E800);
  static const bitterLime700 = Color(0xFFA9D100);
  static const bitterLime800 = Color(0xFF9BB900);
  static const bitterLime900 = Color(0xFF869000);

  // Serenade
  static const seranade50 = Color(0xFFFDFAF3);
  static const seranade100 = Color(0xFFFBF5E8);
  static const seranade200 = Color(0xFFFFF2CE);
  static const seranade300 = Color(0xFFF1DCA1);
  static const seranade400 = Color(0xFFEED590);
  static const seranade500 = Color(0xFFEBCD78);
  static const seranade600 = Color(0xFFE0BB56);
  static const seranade700 = Color(0xFFD1A446);
  static const seranade800 = Color(0xFFC49128);
  static const seranade900 = Color(0xFF6C3D02);

  // Alert
  static const alertSuccess800 = Color(0xFF3A8A1F);
  static const alertSuccess100 = Color(0xFFD6EDC5);
  static const alertError800 = Color(0xFFE32C14);
  static const alertError100 = Color(0xFFFFC9BA);
  static const alertWarning800 = Color(0xFFFF8D00);
  static const alertWarning100 = Color(0xFFFFEBB2);
  static const backgroundWarning = Color(0x66FFE9BD);

  //Speed Comparing
  static const lowInternet1 = Color(0xFFFF8266);
  static const lowInternet2 = Color(0xFFFF6D4C);
  static const speedCompare1 = Color(0xFFFFB11A);
  static const speedCompare2 = Color(0xFF73C23A);

  //Internet Usage
  static const header6_1 = Color(0xFF38454C);

  //Map Direction
  static const mapIcon = Color(0xFFE6E6E6);

  //Problem Alert
  static const inActive = Color(0xFFDAE1E6);
  static const bgProblem = Color.fromRGBO(252, 246, 229, 1);
  static const bgGreen = Color(0xFFDAF7BD);
  static const buttonOverlay = Color(0x0D000000);
}



// Opacity Code Color
// Ex. primaryColor = Color(0xFF73C23A);
// %          Hex         Ex.Color
// 100%       FF          0xFF  73C23A
// 95%	      F2          0xF2  73C23A
// 90%	      E6          0xE6  73C23A
// 85%	      D9          0xD9  73C23A
// 80%	      CC          0xCC  73C23A
// 75%	      BF          0xBF  73C23A
// 70%	      B3          0xB3  73C23A
// 65%	      A6          0xA6  73C23A
// 60%	      99          0x99  73C23A
// 55%	      8C          0x8C  73C23A
// 50%	      80          0x80  73C23A
// 45%	      73          0x73  73C23A
// 40%	      66          0x66  73C23A
// 35%	      59          0x59  73C23A
// 30%	      4D          0x4D  73C23A
// 25%	      40          0x40  73C23A
// 20%	      33          0x33  73C23A
// 15%	      26          0x26  73C23A
// 10%	      1A          0x1A  73C23A
// 5%	        0D          0x0D  73C23A
// 0%	        00          0x00  73C23A