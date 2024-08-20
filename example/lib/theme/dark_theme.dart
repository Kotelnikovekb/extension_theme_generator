
import 'package:flutter/material.dart';

import 'theme.dart';


ThemeData createDarkTheme(){
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      $AppThemeColors.darkColors,
      $AppThemeTextStyles.darkTextStyle,
    ],
  );
}
