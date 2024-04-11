import 'package:flutter/material.dart';

class CollectionTitle extends StatelessWidget {
  const CollectionTitle({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Xem tất cả'),
        ),
      ],
    );
  }
}
