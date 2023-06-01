import 'package:activity_tracker/shared/themes/base_theme.dart';
import 'package:flutter/material.dart';

ThemeData get getDarkTheme {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.pink,
    brightness: Brightness.dark,
  );
  final baseTheme = buildBaseTheme(colorScheme);
  return baseTheme;
}
