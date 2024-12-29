import 'package:flutter/material.dart';

class AppTextStyle {
  static const String? _fontFamily = null;

  static TextStyle regularBlack({double? fontSize, TextOverflow? overflow}) {
    return _baseStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      overflow: overflow,
    );
  }

  static TextStyle mediumBlack({double? fontSize, TextOverflow? overflow}) {
    return _baseStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      overflow: overflow,
    );
  }

  static TextStyle semiBoldBlack({double? fontSize, TextOverflow? overflow}) {
    return _baseStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      overflow: overflow,
    );
  }

  static TextStyle boldBlack({double? fontSize, TextOverflow? overflow}) {
    return _baseStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      overflow: overflow,
    );
  }

  static TextStyle _baseStyle({
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: _fontFamily,
      fontWeight: fontWeight,
      overflow: overflow,
    );
  }
}