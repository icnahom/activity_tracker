import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildBaseTheme(ColorScheme colorScheme){
   final baseTheme = ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  );
  return baseTheme.copyWith(
    appBarTheme: baseTheme.appBarTheme.copyWith(centerTitle: true),
    inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
      border: InputBorder.none,
    ),
    sliderTheme: baseTheme.sliderTheme.copyWith(
      showValueIndicator: ShowValueIndicator.always,
      rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    ),
    chipTheme: baseTheme.chipTheme.copyWith(
      side: BorderSide(color: colorScheme.outlineVariant),
    ),
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}