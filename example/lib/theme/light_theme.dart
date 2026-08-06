import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData createLightTheme() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      $AppThemeColors.lightColors,
      $AppThemeTextStyles.lightTextStyle,
    ],
  );
}
