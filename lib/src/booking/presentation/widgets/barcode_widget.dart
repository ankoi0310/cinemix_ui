import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a DataMatrix barcode
    final bc = Barcode.gs128();

    // Generate a SVG with "Hello World!"
    final svg = bc.toSvg(
      'Hello World!',
      drawText: false,
    );

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 40,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.string(
              svg,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Ticket Code: 123456',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height / 4 * 3 - 24)
      ..quadraticBezierTo(
        size.width * 0.10,
        size.height / 4 * 3,
        0,
        size.height / 4 * 3 + 24,
      )
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height / 4 * 3 + 24)
      ..quadraticBezierTo(
        size.width * 0.90,
        size.height / 4 * 3,
        size.width,
        size.height / 4 * 3 - 24,
      )
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
