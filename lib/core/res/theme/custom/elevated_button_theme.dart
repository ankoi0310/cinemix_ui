import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: KAppColor.lightOnPrimaryColor,
      backgroundColor: KAppColor.lightPrimaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: KAppColor.lightPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: KTextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: KAppColor.darkOnPrimaryColor,
      backgroundColor: KAppColor.darkPrimaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: KAppColor.darkPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: KTextTheme.darkTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
