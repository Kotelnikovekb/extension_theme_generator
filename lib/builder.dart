import 'package:build/build.dart';
import 'package:extension_theme_generator/src/generators/generators.dart';
import 'package:source_gen/source_gen.dart';

Builder textStyleBuilder(BuilderOptions options) => SharedPartBuilder(
      [TextStyleGenerator()],
      'extension_theme_generator',
    );
Builder colorsBuilder(BuilderOptions options) => SharedPartBuilder(
  [ColorsGenerator()],
  'extension_color_generator',
);