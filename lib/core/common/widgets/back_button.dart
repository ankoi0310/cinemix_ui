import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class KBackButton extends StatelessWidget {
  const KBackButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        IconsaxPlusLinear.arrow_circle_left,
        color: Colors.white,
      ),
      onPressed: onPressed ??
          () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
    );
  }
}
