import 'package:flutter/material.dart';

class ButtonBuilder {
  static ElevatedButton fillButton(
    BuildContext context, {
    required VoidCallback? onPressed,
    required Widget child,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
      child: child,
    );
  }

  static ElevatedButton cancelButton({
    required BuildContext context,
    required VoidCallback? onPressed,
    required Widget child,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      child: child,
    );
  }

  static OutlinedButton outlineSecondaryButton({
    required BuildContext context,
    required void Function() onPressed,
    required Widget child,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
