import 'package:flutter/material.dart';

class ButtonBuilder {
  static ElevatedButton submitButton({
    required void Function() onPressed,
    required Widget child,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
