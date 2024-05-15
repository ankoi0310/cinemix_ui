import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class FloatingBackButton extends StatelessWidget {
  const FloatingBackButton({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(IconsaxPlusLinear.arrow_circle_left, size: 32),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 8),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
