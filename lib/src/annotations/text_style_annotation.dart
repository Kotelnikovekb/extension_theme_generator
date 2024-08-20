class TextStyleAnnotation {
  /// Determines whether to use the `final` keyword for generated fields.
  ///
  /// If `true`, the `final` keyword will be used for the fields in the generated
  /// code, indicating that these fields cannot be reassigned after their initial
  /// assignment. If `false`, the `final` keyword will not be used, and the fields
  /// can be reassigned.
  ///
  /// Example usage:
  /// ```dart
  /// @TextStyleAnnotation(useFinal: true)
  /// class MyTextStyles {
  ///   static TextStyle header = TextStyle();
  ///   static TextStyle body = TextStyle();
  /// }
  /// ```
  /// In the generated code, fields `header` and `body` will be marked as `final`.
  final bool useFinal;

  /// Indicates whether style comparison should be enabled for the generated code.
  ///
  /// If `true`, the generator will include logic to compare styles for potential
  /// duplicates or inconsistencies. This can help identify if multiple styles with
  /// the same properties are defined in different places, which might be redundant
  /// or unintended. If `false`, style comparison will be disabled, and the generator
  /// will not include any comparison logic.
  ///
  /// Example usage:
  /// ```dart
  /// @TextStyleAnnotation(enableStyleComparison: true)
  /// class MyTextStyles {
  ///   static TextStyle header = TextStyle(fontSize: 20);
  ///   static TextStyle body = TextStyle(fontSize: 20);
  /// }
  /// ```
  /// In this case, the generator will check if `header` and `body` have the same
  /// properties and will report any potential issues if the comparison finds duplicates.
  final bool enableStyleComparison;

  const TextStyleAnnotation({
    this.useFinal = false,
    this.enableStyleComparison = false,
  });
}
