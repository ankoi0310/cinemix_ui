import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KOutlineButtonThemeData {
  KOutlineButtonThemeData._();

  static final outlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KAppColor.textColor,
      side: const BorderSide(color: KAppColor.primaryColor),
      textStyle: KTextTheme.textTheme.titleSmall,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
