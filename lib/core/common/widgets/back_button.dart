import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/zondicons.dart';

class KBackButton extends StatefulWidget {
  const KBackButton({super.key});

  @override
  State<KBackButton> createState() => _KBackButtonState();
}

class _KBackButtonState extends State<KBackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Iconify(
        Zondicons.cheveron_outline_left,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
