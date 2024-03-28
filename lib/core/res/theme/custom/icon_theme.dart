import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

class KIconTheme {
  KIconTheme._();

  static const double size = 24;

  static const lightIconTheme = IconThemeData(
    size: size,
    color: KAppColor.lightTextColor,
  );

  static const darkIconTheme = IconThemeData(
    size: size,
    color: KAppColor.darkTextColor,
  );
}
