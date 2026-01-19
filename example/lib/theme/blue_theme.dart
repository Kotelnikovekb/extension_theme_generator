
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData createBlueTheme(){
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      $AppThemeColors.blueColors,
      $AppThemeTextStyles.blueTextStyle,
    ],
  );
}