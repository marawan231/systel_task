import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String fontFamily,
  double height,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    height: height,
  );
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
  String fontFamily = FontConstants.defaultFontFamily,
  double height = 0,

}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    
    color,
    fontFamily,
    height,
  );
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
  String fontFamily = FontConstants.defaultFontFamily,
  double height = 0,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    fontFamily,
    height,
  );
}

// light style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
  String fontFamily = FontConstants.defaultFontFamily,
  double height = 0,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    fontFamily,
    height,
  );
}

// bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  String fontFamily = FontConstants.defaultFontFamily,
  double height = 0,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    fontFamily,
    height,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  String fontFamily = FontConstants.defaultFontFamily,
  double height = 0,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    fontFamily,
    height,
  );
}
