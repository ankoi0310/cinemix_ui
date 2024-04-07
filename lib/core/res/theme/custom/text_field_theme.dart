import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: KTextTheme.textTheme.bodyMedium,
    hintStyle: KTextTheme.textTheme.bodyMedium,
    errorStyle: KTextTheme.textTheme.bodyMedium,
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: KTextTheme.titleSmall,
      fontWeight: FontWeight.bold,
      color: KAppColor.primaryColor.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        color: KAppColor.primaryColor,
        width: 2,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: KAppColor.errorColor),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: KAppColor.errorColor.withOpacity(0.8),
        width: 2,
      ),
    ),
  );
}
