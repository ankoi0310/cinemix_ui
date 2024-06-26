import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/app_bar_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/bottom_navigation_bar_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/bottom_sheet_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/elevated_button_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/icon_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/outline_button_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_field_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppTheme {
  KAppTheme._();

  static final textTheme = GoogleFonts.robotoTextTheme();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: KAppColor.primaryColor,
    scaffoldBackgroundColor: KAppColor.surfaceColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: KAppColor.primaryColor,
      primary: KAppColor.primaryColor,
      onPrimary: KAppColor.onPrimaryColor,
      secondary: KAppColor.secondaryColor,
      onSecondary: KAppColor.onSecondaryColor,
      surface: KAppColor.surfaceColor,
      error: KAppColor.errorColor,
      onError: KAppColor.onErrorColor,
      brightness: Brightness.dark,
    ),
    textTheme: textTheme.merge(KTextTheme.textTheme),
    appBarTheme: KAppBarTheme.appBarTheme,
    iconTheme: KIconTheme.iconTheme,
    bottomNavigationBarTheme: KBottomNavigationBarTheme.bottomNavigationBar,
    bottomSheetTheme: KBottomSheetTheme.bottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: KOutlineButtonThemeData.outlineButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.inputDecorationTheme,
  );
}
