import 'package:cinemix_ui/core/shared/enums/image_orientation.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    required this.image,
    required this.orientation,
    super.key,
  });

  final String image;
  final ImageOrientation orientation;

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case ImageOrientation.portrait:
        return Container(
          height: 244,
          width: 173,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        );
      case ImageOrientation.landscape:
        return Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        );
    }
  }
}
