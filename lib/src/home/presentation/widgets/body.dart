import 'package:cinemix_ui/src/home/presentation/widgets/coming_soon.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/custom_search_bar.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/now_playing.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/welcome_header.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeHeader(),
            SizedBox(height: 12),
            CustomSearchBar(),
            SizedBox(height: 12),
            NowPlaying(),
            SizedBox(height: 12),
            ComingSoon(),
            // BestSellingProducts(),
            // RecentlyViewedProducts(),
            // Footer(),
          ],
        ),
      ),
    );
  }
}
