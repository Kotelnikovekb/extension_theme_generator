
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';


ThemeData createLightTheme(){
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      $AppThemeColors.lightColors,
      $AppThemeTextStyles.lightTextStyle,
    ],
  );
}