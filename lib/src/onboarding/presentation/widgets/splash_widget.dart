import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(KAppMedia.splash),
        ),
        const Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: CircleLoading(),
        ),
      ],
    );
  }
}
