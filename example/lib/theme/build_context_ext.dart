
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';


extension BuildContextExtention on BuildContext {
  $AppThemeTextStyles get appText =>
      Theme.of(this).extension<$AppThemeTextStyles>()!;
  $AppThemeColors get appColor => Theme.of(this).extension<$AppThemeColors>()!;
}
