import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.icon,
    required this.text,
    this.onPressed,
    super.key,
  });

  final String icon;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, height: 30),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.mulish(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
