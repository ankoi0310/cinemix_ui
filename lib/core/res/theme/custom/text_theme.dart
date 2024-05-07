import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._();

  static const double headlineLarge = 28;
  static const double headlineMedium = 24;
  static const double headlineSmall = 22;
  static const double titleLarge = 20;
  static const double titleMedium = 18;
  static const double titleSmall = 16;
  static const double bodyLarge = 15;
  static const double bodyMedium = 14;
  static const double bodySmall = 12;

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: headlineLarge,
      fontWeight: FontWeight.bold,
      color: KAppColor.textColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: headlineMedium,
      fontWeight: FontWeight.bold,
      color: KAppColor.textColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: headlineSmall,
      fontWeight: FontWeight.w600,
      color: KAppColor.textColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: titleLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.textColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: titleMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.textColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: titleSmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.textColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: bodyLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.textColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: bodyMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.textColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: bodySmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.textColor,
    ),
  );
}
