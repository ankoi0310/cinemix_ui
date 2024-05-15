import 'package:cinemix_ui/core/res/theme/custom/icon_theme.dart';
import 'package:flutter/material.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static const appBarTheme = AppBarTheme(
    color: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleSpacing: 0,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: KIconTheme.iconTheme,
    actionsIconTheme: KIconTheme.iconTheme,
  );
}
