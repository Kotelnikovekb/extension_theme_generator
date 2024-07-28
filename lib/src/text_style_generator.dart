import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'text_style_annotations.dart';

class TextStyleGenerator extends GeneratorForAnnotation<TextStyleDefinition> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    print('Processing element: ${element.name}');
    if (element is! FieldElement) return '';

    final name = element.name;
    final className = 'ThemeAppTextStyles';

    return '''
class $className extends ThemeExtension<$className> {
  final TextStyle $name;

  const $className({required this.$name});

  @override
  $className copyWith({TextStyle? $name}) {
    return $className(
      $name: $name ?? this.$name,
    );
  }

  @override
  $className lerp(ThemeExtension<$className>? other, double t) {
    if (other is! $className) return this;
    return $className(
      $name: TextStyle.lerp(this.$name, other.$name, t)!,
    );
  }

  static $className of(BuildContext context) {
    return Theme.of(context).extension<$className>()!;
  }
}
''';
  }
}


