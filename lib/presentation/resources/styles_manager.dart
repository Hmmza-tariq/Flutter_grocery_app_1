import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight weight, Color color) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: weight,
    color: color,
  );
}

TextStyle getRegularStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, FontManager.fontFamily, FontWeightManager.regular, color);

TextStyle getLightStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, FontManager.fontFamily, FontWeightManager.regular, color);

TextStyle getMediumStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, FontManager.fontFamily, FontWeightManager.medium, color);

TextStyle getBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, FontManager.fontFamily, FontWeightManager.bold, color);

TextStyle getSemiBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, FontManager.fontFamily, FontWeightManager.semiBold, color);

final headingStyle = TextStyle(
  fontSize: SizeConfig.getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
const productHeadlineStyle = TextStyle(
  color: Colors.black,
  fontSize: FontSize.s17,
  fontFamily: FontManager.fontFamily,
  fontWeight: FontWeight.w700,
);

const textStyle = TextStyle(
  color: ColorManager.textColor,
  fontSize: FontSize.s16,
  fontFamily: FontManager.fontFamily,
  fontWeight: FontWeight.w700,
);

const drawerItemTextStyle = TextStyle(
  color: ColorManager.white,
  fontSize: FontSize.s16,
  fontFamily: FontManager.fontFamily,
  fontWeight: FontWeight.w600,
);
const productTitleStyle = TextStyle(
  color: Colors.black,
  fontSize: FontSize.s24,
  fontFamily: FontManager.fontFamily,
  fontWeight: FontWeight.w600,
);

const colorTextStyle = TextStyle(
  color: ColorManager.black,
  fontSize: FontSize.s12,
  fontFamily: FontManager.fontFamily,
  fontWeight: FontWeight.w700,
);
TextStyle productDescriptionStyle = TextStyle(
  color: ColorManager.grey,
  fontSize: FontSize.s16,
  letterSpacing: 0.30,
  fontWeight: FontWeight.w500,
  fontFamily: FontManager.fontFamily,
);

const priceTextStyle = TextStyle(
  color: ColorManager.textColor,
  fontSize: FontSize.s18,
  fontWeight: FontWeight.w700,
);

const TextStyle splashHeadingTextStyle = TextStyle(
  fontSize: FontSize.s60,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);
const TextStyle kBannerTextStyle = TextStyle(
    fontSize: FontSize.s34, fontWeight: FontWeight.w700, color: Colors.black);

const TextStyle kSearchFieldTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorManager.searchFieldTextColor,
    fontSize: FontSize.s17);
