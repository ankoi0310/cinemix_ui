import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class NavItem {
  NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
}

final List<NavItem> bottomNavItems = [
  NavItem(
    label: 'Trang chủ',
    icon: IconsaxPlusLinear.home,
    activeIcon: IconsaxPlusBold.home,
    route: '/home',
  ),
  NavItem(
    label: 'Phim',
    icon: IconsaxPlusLinear.video,
    activeIcon: IconsaxPlusBold.video,
    route: '/movie',
  ),
  NavItem(
    label: 'Lịch sử',
    icon: IconsaxPlusLinear.clock_1,
    activeIcon: IconsaxPlusBold.clock,
    route: '/history',
  ),
  NavItem(
    label: 'Tôi',
    icon: IconsaxPlusLinear.user,
    activeIcon: IconsaxPlusBold.user,
    route: '/me',
  ),
];
