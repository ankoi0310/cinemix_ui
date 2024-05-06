import 'package:flutter/material.dart';

class CollectionTitle extends StatelessWidget {
  const CollectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
