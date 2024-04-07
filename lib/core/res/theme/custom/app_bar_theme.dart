import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/icon_theme.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static final appBarTheme = AppBarTheme(
    backgroundColor: KAppColor.backgroundColor,
    surfaceTintColor: Colors.transparent,
    titleSpacing: 0,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: KIconTheme.iconTheme,
    actionsIconTheme: KIconTheme.iconTheme,
    titleTextStyle: GoogleFonts.raleway(fontWeight: FontWeight.w600).merge(
      KTextTheme.textTheme.headlineSmall,
    ),
  );
}
