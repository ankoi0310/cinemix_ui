import 'package:flutter/material.dart';

Icon kNavIcon(
  BuildContext context, {
  required IconData icon,
  required bool isActive,
}) {
  return Icon(
    icon,
    color: isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onBackground,
  );
}
