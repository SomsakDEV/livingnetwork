import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:ui_style/ui_style.dart';

class LNBaseTextStyle {
  LNBaseTextStyle._();

  static const head1Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.neutralsBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.5,
    letterSpacing: -0.4,
  );

  static const head2Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.neutralsBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.15,
  );

  static const head4Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.neutralsBlack,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.15,
  );

  static const body1Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.neutralsBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.5,
    letterSpacing: -0.2,
  );

  // below update text style

  static const header1 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 62,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.4,
    // letterSpacing: -0.4,
  );

  static const header2 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 56,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.2,
  );

  static const header3 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.4,
  );

  static const header4 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.4,
  );

  static const header5 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.4,
  );

  static const header6 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.4,
  );

  static const header6_1 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColorsLN.neutralsBlack,
    fontSize: 24,
    fontWeight: FontWeight.w500,  
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1,
    // letterSpacing: -0.4,
  );

  static const body1 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.7,
    // letterSpacing: -0.4,
  );

  static const body2 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.2,
    // letterSpacing: -0.4,
  );

  static const keywords = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.neutralsBlack,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.33,
    // letterSpacing: -0.4,
  );

  static const caption = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.textColorTabbar,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.33,
    // letterSpacing: -0.4,
  );

  static const caption2 = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.textColorTabbar,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const speedCompare5G = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.33,
    // letterSpacing: -0.4,
  );

  static const internetUsageLow = TextStyle(
    fontFamily: 'DB Heavent',
    color: BaseColorsLN.lowInternet1,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
