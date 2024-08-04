
import 'package:flutter/material.dart';
import 'package:extension_theme_generator/extension_theme_generator.dart';

part 'test_colors.g.dart';

@ColorAnnotation()
class LightThemeColors {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFEEEEEE);
}

@ColorAnnotation()
class DarkThemeColors {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF111111);
}
