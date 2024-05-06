import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:cinemix_ui/core/shared/enums/image_orientation.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    required this.orientation,
    this.image,
    super.key,
  });

  final String? image;
  final ImageOrientation orientation;

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case ImageOrientation.portrait:
        return Container(
          height: 244,
          width: 173,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: image == null
                ? Image.asset(KAppMedia.comingSoon, fit: BoxFit.cover)
                : Image.network(image!, fit: BoxFit.cover),
          ),
        );
      case ImageOrientation.landscape:
        return SizedBox(
          height: 150,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: image == null
                ? Image.asset(KAppMedia.comingSoon, fit: BoxFit.cover)
                : Image.network(image!, fit: BoxFit.cover),
          ),
        );
    }
  }
}
