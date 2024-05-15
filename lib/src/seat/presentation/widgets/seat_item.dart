import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    required this.text,
    required this.textColor,
    required this.color,
    super.key,
  });

  final String text;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
