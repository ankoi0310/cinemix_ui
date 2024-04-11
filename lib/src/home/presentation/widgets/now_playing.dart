import 'package:cinemix_ui/src/home/presentation/widgets/collection_title.dart';
import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionTitle(
          title: 'Đang chiếu',
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        // CustomCarousel(
        //   items: [
        //     Image.asset(KAppMedia.welcomeBanner1),
        //     Image.asset(KAppMedia.welcomeBanner2),
        //     Image.asset(KAppMedia.welcomeBanner3),
        //   ],
        // ),
      ],
    );
  }
}
