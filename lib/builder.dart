import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/text_style_generator.dart';

Builder textStyleBuilder(BuilderOptions options) =>
    SharedPartBuilder([TextStyleGenerator()], 'text_style');