import 'package:cinemix_ui/core/common/widgets/custom_bottom_nav_bar.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/home_body.dart';
import 'package:flutter/material.dart';

// 0. The application is in the home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeBody(),
        bottomNavigationBar: CustomBottomNavBar(currentRoute: routeName),
      ),
    );
  }
}
