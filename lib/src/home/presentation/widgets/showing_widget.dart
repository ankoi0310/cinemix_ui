import 'package:cinemix_ui/src/home/presentation/widgets/showing_carousel.dart';
import 'package:flutter/material.dart';

class ShowingWidget extends StatelessWidget {
  const ShowingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: const ShowingCarousel(),
      ),
    );
  }
}
