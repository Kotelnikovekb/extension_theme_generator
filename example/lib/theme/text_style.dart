import 'package:extension_theme_generator/text_style_annotations.dart';
import 'package:flutter/material.dart';

part 'text_style.g.dart';

class TextStyleDefinitions{
  @TextStyleDefinition()
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  @TextStyleDefinition()
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

}