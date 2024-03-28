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

class KAppTheme {
  KAppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: KAppColor.lightPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: KAppColor.lightPrimaryColor,
      onPrimary: KAppColor.lightOnPrimaryColor,
      secondary: KAppColor.lightSecondaryColor,
      onSecondary: KAppColor.lightOnSecondaryColor,
      tertiary: KAppColor.lightTertiaryColor,
      surface: KAppColor.lightBackgroundColor,
      background: KAppColor.lightBackgroundColor,
      onBackground: KAppColor.lightOnBackgroundColor,
      error: KAppColor.lightErrorColor,
      onError: KAppColor.lightOnErrorColor,
    ),
    textTheme: KTextTheme.lightTextTheme,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    iconTheme: KIconTheme.lightIconTheme,
    bottomNavigationBarTheme:
        KBottomNavigationBarTheme.lightBottomNavigationBar,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: KOutlineButtonThemeData.lightOutlineButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: KAppColor.darkPrimaryColor,
    scaffoldBackgroundColor: KAppColor.darkBackgroundColor,
    textTheme: KTextTheme.darkTextTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    iconTheme: KIconTheme.darkIconTheme,
    bottomNavigationBarTheme: KBottomNavigationBarTheme.darkBottomNavigationBar,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlineButtonThemeData.darkOutlineButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.darInputDecorationTheme,
  );
}
