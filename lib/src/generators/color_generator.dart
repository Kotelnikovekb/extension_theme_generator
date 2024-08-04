import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations/color_annotation.dart';

class ColorsGenerator extends GeneratorForAnnotation<ColorAnnotation> {
  static final Map<String, Map<String, String>> _themeFields = {};
  static bool _hasWritten = false;

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async{
    try{
      // Check if the file has already been written
      if (_hasWritten) {
        return '';
      }

      _themeFields.clear();
      final output = StringBuffer();

      final classElement = element as ClassElement;
      final className = classElement.name;

      for (final field in classElement.fields) {
        if (field.isStatic) {
          final fieldType = field.type.getDisplayString(withNullability: false);
          _themeFields.putIfAbsent(className, () => {});
          _themeFields[className]![field.name] = fieldType;
        }
      }

      output.writeln('class CombinedThemeColors {');
      _themeFields.forEach((className, fields) {
        fields.forEach((fieldName, fieldType) {
          output.writeln(
              '  static const $fieldType ${className}_$fieldName = $className.$fieldName;');
        });
      });
      output.writeln('}');

      await buildStep.writeAsString(
          buildStep.inputId.changeExtension('.extension_theme_generator.g.part'),
          output.toString());

      // Mark as written
      _hasWritten = true;

      return output.toString();
    }catch(e,s){
      print(e);
      return 'class Error{///${e}}';
    }
  }
}