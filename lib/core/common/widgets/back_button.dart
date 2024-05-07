import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class KBackButton extends StatefulWidget {
  const KBackButton({super.key});

  @override
  State<KBackButton> createState() => _KBackButtonState();
}

class _KBackButtonState extends State<KBackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        IconsaxPlusBold.arrow_circle_left,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
