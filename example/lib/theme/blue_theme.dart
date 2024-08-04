
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData createBlueTheme(){
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      $AppThemeColors.blueColors,
      $AppThemeTextStyles.blueTextStyle,
    ],
  );
}