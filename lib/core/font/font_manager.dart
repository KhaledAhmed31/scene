import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FontManager {
  static TextStyle _getInterFontStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle _getPoppinsFontStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle getLightInterStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getInterFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
      height: height,
    );
  }

  static TextStyle getBoldInterStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getInterFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
    );
  }

  static TextStyle getMediumInterStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getInterFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
    );
  }

  static TextStyle getRegularInterStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getInterFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
    );
  }

  static TextStyle getSemiBoldInterStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getInterFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
    );
  }

  static TextStyle getLightPoppinsStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getPoppinsFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
      height: height,
    );
  }

  static TextStyle getBoldPoppinsStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getPoppinsFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
    );
  }

  static TextStyle getMediumPoppinsStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getPoppinsFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
    );
  }

  static TextStyle getRegularPoppinsStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getPoppinsFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
    );
  }

  static TextStyle getSemiBoldPoppinsStyle({
    Color? color,
    double? fontSize,
    double? height,
  }) {
    return _getPoppinsFontStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
    );
  }
}
