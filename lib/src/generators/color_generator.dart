import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../../extension_theme_generator.dart';

class ColorsGenerator extends GeneratorForAnnotation<ColorAnnotation> {
  final Map<String, Map<String, String>> _themeFields = {};
  final Set<String> _allFields = {};


  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    _themeFields.clear();
    _allFields.clear();

    final output = StringBuffer();


    final colorChecker = TypeChecker.typeNamed(
      ColorAnnotation,
      inPackage: 'extension_theme_generator',
    );

    for (final annotated in library.annotatedWith(colorChecker)) {
      final element = annotated.element;
      if (element is! ClassElement) continue;

      final classElement = element;
      final className = classElement.name;

      if(className==null){
        print('className null');
        continue;
      }

      for (final field in classElement.fields) {
        if (!field.isStatic) continue;

        final fieldType = field.type.getDisplayString(withNullability: false);
        _themeFields.putIfAbsent(className, () => {});
        _themeFields[className]![field.name!] = fieldType;

        _allFields.add(field.name!);
      }
    }

    if (_allFields.isEmpty) {
      print('_allFields.isEmpty');

      return '';
    }

    output.writeln('class \$AppThemeColors extends ThemeExtension<\$AppThemeColors> {');

    for (final fieldName in _allFields) {
      output.writeln('  final Color $fieldName;');
    }

    output.write('\n  const \$AppThemeColors({');
    for (final fieldName in _allFields) {
      output.write('required this.$fieldName, ');
    }
    output.writeln('});\n');

    output.write('  @override \$AppThemeColors copyWith({');
    for (final fieldName in _allFields) {
      output.write('Color? $fieldName, ');
    }
    output.writeln('}) {');
    output.write('    return \$AppThemeColors(');
    for (final fieldName in _allFields) {
      output.write('$fieldName: $fieldName ?? this.$fieldName, ');
    }
    output.writeln(');');
    output.writeln('  }');

    output.write('  @override \$AppThemeColors lerp(ThemeExtension<\$AppThemeColors>? other, double t) {');
    output.writeln('    if (other is! \$AppThemeColors) return this;');
    output.write('    return \$AppThemeColors(');
    for (final fieldName in _allFields) {
      output.write('$fieldName: Color.lerp($fieldName, other.$fieldName, t)!, ');
    }
    output.writeln(');');
    output.writeln('  }');

    _themeFields.forEach((className, fields) {
      final variableName = _lowercaseFirstLetter(className);
      output.write('  static const \$AppThemeColors $variableName = \$AppThemeColors(');
      for (final fieldName in _allFields) {
        if (fields.containsKey(fieldName)) {
          output.write('$fieldName: $className.$fieldName, ');
        } else {
          output.write('$fieldName: Colors.red, ');
          print('Warning: $className does not contain field $fieldName');
        }
      }
      output.writeln(');');
    });

    output.writeln('}');

    return output.toString();
  }

  String _lowercaseFirstLetter(String input) =>
      input.isNotEmpty ? input[0].toLowerCase() + input.substring(1) : '';
}