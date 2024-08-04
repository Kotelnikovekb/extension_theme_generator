

import 'package:extension_theme_generator/extension_theme_generator.dart';
import 'package:flutter/material.dart';

part 'app_colors.g.dart';

@ColorsClass()
class AppColors{
  @ColorItem('dark','primary')
  Color primaryColorDark=const Color.fromARGB(1, 1, 1, 1);
  @ColorItem('light','primary')
  Color primaryColorLight=const Color.fromARGB(1, 1, 1, 1);
}