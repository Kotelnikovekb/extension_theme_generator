import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:extension_theme_generator/extension_theme_generator.dart';
import 'package:source_gen/source_gen.dart';


class TextStyleGenerator extends GeneratorForAnnotation<TextStyleAnnotation> {
  final Map<String, Map<String, String>> _themeFields = {};

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
    //_allFields.clear();
    final output = StringBuffer();
    for (final annotatedElement in library.annotatedWith(const TypeChecker.fromRuntime(TextStyleAnnotation))) {
      final element = annotatedElement.element;

      if (element is! ClassElement) continue;

      final classElement = element as ClassElement;
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

    output.writeln('class \$AppThemeTextStyles extends ThemeExtension<\$AppThemeTextStyles> {');

    // Генерация полей
    _allFields.forEach((fieldName) {
      output.writeln('  final TextStyle $fieldName;');
    });


    // Генерация конструктора
    output.write('\n  const \$AppThemeTextStyles({');
    _allFields.forEach((fieldName) {
      output.write('required this.$fieldName, ');
    });
    output.writeln('});\n');

// Генерация метода copyWith
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

    // Генерация метода lerp
    output.write('  @override \$AppThemeTextStyles lerp(ThemeExtension<\$AppThemeTextStyles>? other, double t) {');
    output.writeln('    if (other is! \$AppThemeTextStyles) return this;');
    output.write('    return \$AppThemeTextStyles(');
    _allFields.forEach((fieldName) {
      output.write('$fieldName: TextStyle.lerp($fieldName, other.$fieldName, t)!, ');
    });
    output.writeln(');');
    output.writeln('  }');

    // Генерация статических свойств для каждого аннотированного класса
    _themeFields.forEach((className, fields) {
      final variableName = _lowercaseFirstLetter(className);
      output.write('  static const \$AppThemeTextStyles $variableName = \$AppThemeTextStyles(');
      _allFields.forEach((fieldName) {
        if (fields.containsKey(fieldName)) {
          output.write('$fieldName: $className.$fieldName, ');
        } else {
          output.write('$fieldName: TextStyle(fontSize: 32), ');
          print('Warning: $className does not contain field $fieldName');
        }
      });
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