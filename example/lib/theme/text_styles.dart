part of 'theme.dart';

@TextStyleAnnotation(useFinal: true,enableStyleComparison: true)
class DarkTextStyle {
  static TextStyle header = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle body = TextStyle(
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
@TextStyleAnnotation()
class BlueTextStyle {
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.blue,
  );
}