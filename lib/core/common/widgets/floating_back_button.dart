import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
          IconsaxPlusBold.arrow_circle_left,
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
