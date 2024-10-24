import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../../extension_theme_generator.dart';


class ColorsGenerator extends GeneratorForAnnotation<ColorAnnotation> {
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
    final output = StringBuffer();
    for (final annotatedElement in library.annotatedWith(const TypeChecker.fromRuntime(ColorAnnotation))) {
      final element = annotatedElement.element;

      if (element is! ClassElement) continue;

      final classElement = element;
      final className = classElement.name;

      for (final field in classElement.fields) {
        if (field.isStatic) {
          final fieldType = field.type.getDisplayString(withNullability: false);
          _themeFields.putIfAbsent(className, () => {});
          _themeFields[className]![field.name] = fieldType;

          _allFields.add(field.name);
        }
      }
    }

    if(_allFields.isEmpty){
      return '';
    }

    output.writeln('class \$AppThemeColors extends ThemeExtension<\$AppThemeColors> {');

    // Генерация полей
    for (var fieldName in _allFields) {
      output.writeln('  final Color $fieldName;');
    }

    // Генерация конструктора
    output.write('\n  const \$AppThemeColors({');
    for (var fieldName in _allFields) {
      output.write('required this.$fieldName, ');
    }
    output.writeln('});\n');

    // Генерация метода copyWith
    output.write('  @override \$AppThemeColors copyWith({');
    for (var fieldName in _allFields) {
      output.write('Color? $fieldName, ');
    }
    output.writeln('}) {');
    output.write('    return \$AppThemeColors(');
    for (var fieldName in _allFields) {
      output.write('$fieldName: $fieldName ?? this.$fieldName, ');
    }
    output.writeln(');');
    output.writeln('  }');

    // Генерация метода lerp
    output.write('  @override \$AppThemeColors lerp(ThemeExtension<\$AppThemeColors>? other, double t) {');
    output.writeln('    if (other is! \$AppThemeColors) return this;');
    output.write('    return \$AppThemeColors(');
    for (var fieldName in _allFields) {
      output.write('$fieldName: Color.lerp($fieldName, other.$fieldName, t)!, ');
    }
    output.writeln(');');
    output.writeln('  }');

    // Генерация статических свойств для каждого аннотированного класса
    _themeFields.forEach((className, fields) {
      final variableName = _lowercaseFirstLetter(className);
      output.write('  static const \$AppThemeColors $variableName = \$AppThemeColors(');
      for (var fieldName in _allFields) {
        if (fields.containsKey(fieldName)) {
          output.write('$fieldName: $className.$fieldName, ');
        } else {
          output.write('$fieldName: Colors.red, ');
          print('Warning: $className does not contain field $fieldName');
        }
      }
      output.writeln(');');
    });
    
    /// Конец файла
    output.writeln('}');
    


    return output.toString();
  }
  String _lowercaseFirstLetter(String input) {
    return input.isNotEmpty ? input[0].toLowerCase() + input.substring(1) : '';
  }
}