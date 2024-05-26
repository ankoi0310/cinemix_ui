import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/showing_carousel.dart';
import 'package:flutter/material.dart';

class ShowingWidget extends StatelessWidget {
  const ShowingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KAppColor.secondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const ShowingCarousel(),
    );
  }
}
