import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/user/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class NavItem {
  NavItem({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;
}

final List<NavItem> bottomNavItems = [
  NavItem(
    label: 'Trang chủ',
    icon: IconsaxPlusLinear.home,
    route: HomeScreen.routeName,
  ),
  NavItem(
    label: 'Lịch sử',
    icon: IconsaxPlusLinear.clock_1,
    route: '/history',
  ),
  NavItem(
    label: 'Hồ sơ',
    icon: IconsaxPlusLinear.user,
    route: ProfileScreen.routeName,
  ),
];
