import 'package:build/build.dart';
import 'package:extension_theme_generator/src/test_generator.dart';
import 'package:extension_theme_generator/src/text_style_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder textStyleBuilder(BuilderOptions options) => SharedPartBuilder(
      [TextStyleGenerator()],
      'extension_theme_generator',
    );
