import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KBottomNavigationBarTheme {
  KBottomNavigationBarTheme._();

  static final bottomNavigationBar = BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: KAppColor.primaryColor,
    unselectedItemColor: Colors.grey[400],
    selectedLabelStyle: KTextTheme.textTheme.titleSmall?.copyWith(
      color: KAppColor.primaryColor,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: KTextTheme.textTheme.titleSmall?.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
    ),
  );
}
