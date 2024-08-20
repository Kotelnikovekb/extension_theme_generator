import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:extension_theme_generator/extension_theme_generator.dart';
import 'package:source_gen/source_gen.dart';


class TextStyleGenerator extends GeneratorForAnnotation<TextStyleAnnotation> {
  final Map<String, Map<String, String>> _themeFields = {};
  final Map<String, bool> _useFinalMap = {};
  final Map<String, bool> _enableStyleComparisonMap = {};
  final Set<String> _allFields = {};

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final classElement = element as ClassElement;
    final className = classElement.name;


    for (final field in classElement.fields) {
      if (field.isStatic) {
        final fieldType = field.type.getDisplayString(withNullability: false);
        _themeFields.putIfAbsent(className, () => {});
        _themeFields[className]![field.name] = fieldType;
      }
    }

    return '';
  }

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    _themeFields.clear();
    _allFields.clear();
    _useFinalMap.clear();

    final output = StringBuffer();

    for (final annotatedElement in library.annotatedWith(const TypeChecker.fromRuntime(TextStyleAnnotation))) {
      final element = annotatedElement.element;

      if (element is! ClassElement) continue;

      final classElement = element as ClassElement;
      final className = classElement.name;
      _useFinalMap[className] = annotatedElement.annotation.peek('useFinal')?.boolValue ?? false;
      _enableStyleComparisonMap[className] = annotatedElement.annotation.peek('enableStyleComparison')?.boolValue ?? false;


      for (final field in classElement.fields) {
        if (field.isStatic) {
          final fieldType = field.type.getDisplayString(withNullability: false);
          _themeFields.putIfAbsent(className, () => {});
          _themeFields[className]![field.name] = fieldType;

          _allFields.add(field.name);
        }
      }


    }

    if (_allFields.isEmpty) {
      return '';
    }

    output.writeln('class \$AppThemeTextStyles extends ThemeExtension<\$AppThemeTextStyles> {');

    _allFields.forEach((fieldName) {
      output.writeln('  final TextStyle $fieldName;');
    });

    output.write('\n  const \$AppThemeTextStyles({');
    _allFields.forEach((fieldName) {
      output.write('required this.$fieldName, ');
    });
    output.writeln('});\n');

    output.write('  @override \$AppThemeTextStyles copyWith({');
    _allFields.forEach((fieldName) {
      output.write('TextStyle? $fieldName, ');
    });
    output.writeln('}) {');
    output.write('    return \$AppThemeTextStyles(');
    _allFields.forEach((fieldName) {
      output.write('$fieldName: $fieldName ?? this.$fieldName, ');
    });
    output.writeln(');');
    output.writeln('  }');

    output.write('  @override \$AppThemeTextStyles lerp(ThemeExtension<\$AppThemeTextStyles>? other, double t) {');
    output.writeln('    if (other is! \$AppThemeTextStyles) return this;');
    output.write('    return \$AppThemeTextStyles(');
    _allFields.forEach((fieldName) {
      output.write('$fieldName: TextStyle.lerp($fieldName, other.$fieldName, t)!, ');
    });
    output.writeln(');');
    output.writeln('  }');

    _themeFields.forEach((className, fields) {
      final variableName = _lowercaseFirstLetter(className);
      final staticType = fields.values.any((_) => _useFinalMap[className] ?? false) ? 'final' : 'const';

      output.write('  static $staticType \$AppThemeTextStyles $variableName = \$AppThemeTextStyles(');
      _allFields.forEach((fieldName) {
        if (fields.containsKey(fieldName)) {
          output.write('$fieldName: $className.$fieldName, ');
        } else {
          output.write('$fieldName: TextStyle(fontSize: 32), ');
          print('Warning: $className does not contain field $fieldName');
        }
      });
      output.writeln(');');

      final enableStyleComparison = _enableStyleComparisonMap[className] ?? false;

      if (enableStyleComparison) {
        _compareStyles();
      }
    });

    output.writeln('}');


    return output.toString();
  }

  void _compareStyles() {
    final duplicates = <String, List<String>>{};

    _themeFields.forEach((className, fields) {
      fields.forEach((fieldName, fieldType) {
        final duplicateKeys = _themeFields.keys.where((otherClassName) {
          if (className == otherClassName) return false;
          return _themeFields[otherClassName]?[fieldName] == fieldType;
        }).toList();

        if (duplicateKeys.isNotEmpty) {
          duplicates.putIfAbsent(fieldName, () => []).addAll(duplicateKeys);
        }
      });
    });

    if (duplicates.isNotEmpty) {
      print('Duplicate styles found:');
      duplicates.forEach((fieldName, classes) {
        print('$fieldName is identical in: ${classes.join(', ')}');
      });
    }
  }

  String _lowercaseFirstLetter(String input) {
    return input.isNotEmpty ? input[0].toLowerCase() + input.substring(1) : '';
  }

}