import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/icon_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: KAppColor.lightBackgroundColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: KIconTheme.lightIconTheme,
    actionsIconTheme: KIconTheme.lightIconTheme,
    titleTextStyle: KTextTheme.lightTextTheme.headlineSmall,
  );

  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: KAppColor.darkBackgroundColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: KIconTheme.darkIconTheme,
    actionsIconTheme: KIconTheme.darkIconTheme,
    titleTextStyle: KTextTheme.darkTextTheme.headlineSmall,
  );
}
