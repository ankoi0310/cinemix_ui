import 'package:cinemix_ui/core/common/widgets/custom_bottom_nav_bar.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeBody()),
      bottomNavigationBar: CustomBottomNavBar(
        currentRoute: HomeScreen.routeName,
      ),
    );
  }
}
