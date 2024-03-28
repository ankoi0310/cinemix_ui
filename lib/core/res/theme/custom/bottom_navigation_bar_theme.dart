import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KBottomNavigationBarTheme {
  KBottomNavigationBarTheme._();

  static final lightBottomNavigationBar = BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: KAppColor.lightPrimaryColor,
    unselectedItemColor: Colors.grey[400],
    selectedLabelStyle: KTextTheme.lightTextTheme.titleSmall?.copyWith(
      color: KAppColor.lightPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: KTextTheme.lightTextTheme.titleSmall?.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
    ),
  );

  static final darkBottomNavigationBar = BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    selectedItemColor: KAppColor.darkPrimaryColor,
    unselectedItemColor: Colors.grey[400],
    selectedLabelStyle: KTextTheme.darkTextTheme.titleSmall?.copyWith(
      color: KAppColor.darkPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: KTextTheme.darkTextTheme.titleSmall?.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
    ),
  );
}
