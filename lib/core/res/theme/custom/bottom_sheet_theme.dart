import 'package:flutter/material.dart';

class KBottomSheetTheme {
  KBottomSheetTheme._();

  static BottomSheetThemeData bottomSheetTheme = BottomSheetThemeData(
    elevation: 0,
    showDragHandle: false,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
