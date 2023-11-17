import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required String fontFamily}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize);
}

TextStyle getRegular({required double fontSize, required Color fontColor}) {
  return _getTextStyle(
      fontFamily: FontManager.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: fontColor);
}

TextStyle getBold({required double fontSize, required Color fontColor}) {
  return _getTextStyle(
      fontFamily: FontManager.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: fontColor);
}

TextStyle getLight({required double fontSize, required Color fontColor}) {
  return _getTextStyle(
      fontFamily: FontManager.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: fontColor);
}

TextStyle getMedium({required double fontSize, required Color fontColor}) {
  return _getTextStyle(
      fontFamily: FontManager.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: fontColor);
}

TextStyle getSemiBold({required double fontSize, required Color fontColor}) {
  return _getTextStyle(
      fontFamily: FontManager.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.semibold,
      color: fontColor);
}


