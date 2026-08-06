part of 'theme.dart';

@ColorAnnotation()
class LightColors {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFEEEEEE);
  static const Color background = Color(0xFFEDF6F6);

  static const MaterialColor secondary2 = MaterialColor(
    0xFFA5E5D8,
    <int, Color>{
      100: Color(0xFFDFF9F1),
      300: Color(0xFFCEF4E9),
      500: Color(0xFFA5E5D8),
      700: Color(0xFF30AA96),
      900: Color(0xFF2A403D),
    },
  );
}

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
