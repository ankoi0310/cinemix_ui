import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FloatingBackButton extends StatelessWidget {
  const FloatingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      child: IconButton(
        icon: const Icon(
          Iconsax.arrow_circle_left,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
