library extension_theme_generator;


import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void>{
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final String returnType = element.returnType.toString();
    className = returnType.replaceAll("*", "");
  }
  @override
  void visitFieldElement(FieldElement element) {
    String elementType = element.type.toString().replaceAll("*", "");
    fields[element.name] = elementType;

  }
}