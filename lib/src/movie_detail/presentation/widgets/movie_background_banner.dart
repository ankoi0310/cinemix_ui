import 'package:flutter/material.dart';

class MovieBackgroundBanner extends StatelessWidget {
  const MovieBackgroundBanner({
    required this.banner,
    super.key,
  });

  final String banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ).createShader(
              Rect.fromLTRB(0, 0, bounds.width, bounds.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(banner),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
