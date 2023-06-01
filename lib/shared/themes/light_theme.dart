import 'package:flutter/material.dart';

import 'base_theme.dart';

ThemeData get getLightTheme {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.pink,
  );
  final baseTheme = buildBaseTheme(colorScheme);
  return baseTheme;
}
