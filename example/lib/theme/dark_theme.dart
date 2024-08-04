
import 'package:flutter/material.dart';

import 'theme.dart';


ThemeData createDarkTheme(){
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      $AppThemeColors.darkColors,
      $AppThemeTextStyles.darkTextStyle,
    ],
  );
}
