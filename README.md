# Extension Theme Generator
[![Pub](https://img.shields.io/pub/v/extension_theme_generator)](https://pub.dev/packages/extension_theme_generator)

## Language Versions

- [English](README.md)
- [Русский](README_ru.md)


Flutter Extension Theme Generator is a tool for generating ThemeExtension in Flutter projects, simplifying the management of custom themes. With the help of two decorators, @TextStyleAnnotation() and @ColorAnnotation(), you can easily create a theme that meets your requirements.

## Key Features:
- **Ease of Use**: Simply add @TextStyleAnnotation() or @ColorAnnotation() to your class with color or text style information.
- **Automatic Generation**: Run the command flutter pub run build_runner build to automatically generate the necessary code for ThemeExtension.
- **Flexibility**: You can create any number of application themes, not just dark and light.

## Example Usage
A detailed example can be found in /example.

1. Add the dependencies build_runner and extension_theme_generator:
```yaml
dependencies:
  extension_theme_generator: ^1.0.0

dev_dependencies:
  build_runner: ^2.4.11
```
2. Add classes for text styles and colors

**Example for colors:**
```dart
@ColorAnnotation()
class DarkColors {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF111111);
  static const Color textColor = Color(0xFF111111);
  static const Color background = Color(0xFF015D60);
}

@ColorAnnotation()
class BlueColors {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF111111);
  static const Color textColor = Color(0xFF111111);
  static const Color background = Color(0xFFC4EDF3);
}
```

**Example for text styles:**
```dart
@TextStyleAnnotation()
class DarkTextStyle {
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}


@TextStyleAnnotation()
class LightTextStyle {
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
```
> You can add any number of themes and are not limited to just dark and light themes.


3. Add the path for the generation file:
   For example, `part 'theme.g.dart';`
4. Run the command `flutter pub run build_runner build`.
5. Update  ThemeData:
   Add.
```dart
ThemeData createDarkTheme(){
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      $AppThemeColors.darkColors,// Generated class for colors
      $AppThemeTextStyles.darkTextStyle, // Generated class for text styles
    ],
  );
}
```

# About the author
My telegram channel - [@kotelnikoff_dev](https://t.me/kotelnikoff_dev)