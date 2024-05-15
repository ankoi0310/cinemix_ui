import 'package:flutter/material.dart';

Text kNavLabel(
  BuildContext context, {
  required String label,
  bool isActive = false,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        ),
  );
}
