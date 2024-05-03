import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Description extends StatelessWidget {
  const Description({
    required this.storyline,
    super.key,
  });

  final String storyline;

  @override
  Widget build(BuildContext context) {
    final style =
        Theme.of(context).textTheme.bodyMedium!.copyWith(inherit: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cốt truyện', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        ReadMoreText(
          storyline,
          trimLength: 200,
          trimCollapsedText: 'Xem thêm',
          trimExpandedText: 'Thu gọn',
          style: style,
          moreStyle: style.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          lessStyle: style.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
