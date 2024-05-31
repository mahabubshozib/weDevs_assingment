import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyleSourceRoboto(
    {required double fontSize,
      Color? color,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      double? letterspacing}) {
  return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color ?? Colors.black,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterspacing);
}


TextStyle ERROR_TEXT_STYLE =
const TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 10);