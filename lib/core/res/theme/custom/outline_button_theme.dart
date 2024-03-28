import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KOutlineButtonThemeData {
  KOutlineButtonThemeData._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KAppColor.lightTextColor,
      side: const BorderSide(color: KAppColor.lightPrimaryColor),
      textStyle: KTextTheme.lightTextTheme.titleSmall,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KAppColor.darkTextColor,
      side: const BorderSide(color: KAppColor.darkPrimaryColor),
      textStyle: KTextTheme.darkTextTheme.titleSmall,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
