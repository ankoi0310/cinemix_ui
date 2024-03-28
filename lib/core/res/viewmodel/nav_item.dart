import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class NavItem {
  final String label;
  final IconData icon;
  final String route;

  NavItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

final List<NavItem> botNavItems = [
  NavItem(
    label: 'Home',
    icon: SolarIconsBold.home,
    route: '/home',
  ),
  NavItem(
    label: 'Calendar',
    icon: SolarIconsBold.calendarMinimalistic,
    route: '/calendar',
  ),
  NavItem(
    label: 'Transcript',
    icon: SolarIconsBold.checklistMinimalistic,
    route: '/transcript',
  ),
  NavItem(
    label: 'Settings',
    icon: SolarIconsBold.settings,
    route: '/settings',
  ),
];
