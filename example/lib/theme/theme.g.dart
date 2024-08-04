// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// ColorsGenerator
// **************************************************************************

class $AppThemeColors extends ThemeExtension<$AppThemeColors> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color textColor;

  const $AppThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.textColor,
  });

  @override
  $AppThemeColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? textColor,
  }) {
    return $AppThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  $AppThemeColors lerp(ThemeExtension<$AppThemeColors>? other, double t) {
    if (other is! $AppThemeColors) return this;
    return $AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  static const $AppThemeColors lightColors = $AppThemeColors(
    primary: LightColors.primary,
    secondary: LightColors.secondary,
    background: LightColors.background,
    textColor: Colors.red,
  );
  static const $AppThemeColors darkColors = $AppThemeColors(
    primary: DarkColors.primary,
    secondary: DarkColors.secondary,
    background: DarkColors.background,
    textColor: DarkColors.textColor,
  );
  static const $AppThemeColors blueColors = $AppThemeColors(
    primary: BlueColors.primary,
    secondary: BlueColors.secondary,
    background: BlueColors.background,
    textColor: BlueColors.textColor,
  );
}

// **************************************************************************
// TextStyleGenerator
// **************************************************************************

class $AppThemeTextStyles extends ThemeExtension<$AppThemeTextStyles> {
  final TextStyle header;
  final TextStyle body;

  const $AppThemeTextStyles({
    required this.header,
    required this.body,
  });

  @override
  $AppThemeTextStyles copyWith({
    TextStyle? header,
    TextStyle? body,
  }) {
    return $AppThemeTextStyles(
      header: header ?? this.header,
      body: body ?? this.body,
    );
  }

  @override
  $AppThemeTextStyles lerp(
      ThemeExtension<$AppThemeTextStyles>? other, double t) {
    if (other is! $AppThemeTextStyles) return this;
    return $AppThemeTextStyles(
      header: TextStyle.lerp(header, other.header, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
    );
  }

  static const $AppThemeTextStyles darkTextStyle = $AppThemeTextStyles(
    header: DarkTextStyle.header,
    body: DarkTextStyle.body,
  );
  static const $AppThemeTextStyles lightTextStyle = $AppThemeTextStyles(
    header: LightTextStyle.header,
    body: LightTextStyle.body,
  );
  static const $AppThemeTextStyles blueTextStyle = $AppThemeTextStyles(
    header: BlueTextStyle.header,
    body: BlueTextStyle.body,
  );
}
