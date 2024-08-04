# Extension Theme Generator
[![Pub](https://img.shields.io/pub/v/extension_theme_generator)](https://pub.dev/packages/extension_theme_generator)

## Language Versions

- [English](README.md)
- [Русский](README_ru.md)


Extension Theme Generator — это инструмент для генерации ThemeExtension в проектах Flutter, упрощающий управление пользовательскими темами. Благодаря двум декораторам, @TextStyleAnnotation() и @ColorAnnotation(), вы можете легко создать тему, соответствующую вашим требованиям.
## Основные функции:
- **Легкость использования**: Просто добавьте @TextStyleAnnotation() или @ColorAnnotation() к своему классу с информацией о цветах или текстовых стилях.
- **Автоматическая генерация**: Выполните команду flutter pub run build_runner build, чтобы автоматически сгенерировать необходимый код для ThemeExtension.
- **Гибкость**: Вы можете создать любое количество тем приложения, а не только темные и светлые.

## Пример использования
Подробный пример в /example

1. Добавьте зависимости build_runner и extension_theme_generator:
```yaml
dependencies:
  extension_theme_generator: ^1.0.0

dev_dependencies:
  build_runner: ^2.4.11
```
2. Добавьте классы для текстовых стилей и цветов
 
**Пример для цветов**
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

**Пример для текста**
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
> Вы можете добавить любое количество тем и не ограничиваться только темной и светлой темой.

3. Добавьте путь для файла генерации:
Например, `part 'theme.g.dart';`
4. Запустите команду `flutter pub run build_runner build`.
5. Обновите ThemeData:
   Добавьте. 
```dart
ThemeData createDarkTheme(){
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      $AppThemeColors.darkColors,// Сгенерированный класс для цветов
      $AppThemeTextStyles.darkTextStyle, // Сгенерированный класс для текста
    ],
  );
}
```

# От автора
Я в telegram - [@kotelnikoff_dev](https://t.me/kotelnikoff_dev)
[Подкинте автору на кофе](https://www.tinkoff.ru/rm/kotelnikov.yuriy2/PzxiM41989/), а то ему еще песика кормить