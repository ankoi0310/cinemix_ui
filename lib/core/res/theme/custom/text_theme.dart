import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._();

  static const double headlineLarge = 32;
  static const double headlineMedium = 24;
  static const double headlineSmall = 20;
  static const double titleLarge = 16;
  static const double titleMedium = 14;
  static const double titleSmall = 12;
  static const double bodyLarge = 15;
  static const double bodyMedium = 14;
  static const double bodySmall = 12;

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: headlineLarge,
      fontWeight: FontWeight.bold,
      color: KAppColor.lightTextColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: headlineMedium,
      fontWeight: FontWeight.bold,
      color: KAppColor.lightTextColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: headlineSmall,
      fontWeight: FontWeight.w600,
      color: KAppColor.lightTextColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: titleLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.lightTextColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: titleMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.lightTextColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: titleSmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.lightTextColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: bodyLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.lightTextColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: bodyMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.lightTextColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: bodySmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.lightTextColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: headlineLarge,
      fontWeight: FontWeight.bold,
      color: KAppColor.darkTextColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: headlineMedium,
      fontWeight: FontWeight.bold,
      color: KAppColor.darkTextColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: headlineSmall,
      fontWeight: FontWeight.w600,
      color: KAppColor.darkTextColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: titleLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.darkTextColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: titleMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.darkTextColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: titleSmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.darkTextColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: bodyLarge,
      fontWeight: FontWeight.w500,
      color: KAppColor.darkTextColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: bodyMedium,
      fontWeight: FontWeight.w400,
      color: KAppColor.darkTextColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: bodySmall,
      fontWeight: FontWeight.w400,
      color: KAppColor.darkTextColor,
    ),
  );
}
