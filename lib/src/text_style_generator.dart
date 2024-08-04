import 'dart:async';
import 'package:build/build.dart';
import 'package:extension_theme_generator/src/visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import '../extension_theme_generator.dart';
import 'text_style_annotations.dart';

class TextStyleGenerator extends GeneratorForAnnotation<Sigma> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) return 'class NotFound{}';

    try{
      final visitor = Visitor();
      element.visitChildren(visitor);

      var buffer = StringBuffer();

      buffer.writeln("extension \$${visitor.className} on ${visitor.className}{");
      visitor.printData.keys.forEach((element) {
        buffer.writeln(
            "void print_$element(){ print(\"Annotation ${visitor
                .printData[element]}\");}");
      });

      return buffer.toString()+'}';
    }catch(e,s){
      print(e);
      print(s);
      return 'class HelloWorld{}';
    }
  }
}
