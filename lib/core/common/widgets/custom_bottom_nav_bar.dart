import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/viewmodel/nav_item.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({this.currentRoute, super.key});

  final String? currentRoute;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.currentRoute != null) {
      setState(() {
        _selectedIndex = bottomNavItems.indexWhere(
          (element) => element.route == widget.currentRoute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      onItemSelected: (index) {
        if (_selectedIndex == index) return;
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pushReplacementNamed(context, bottomNavItems[index].route);
      },
      shadows: [
        BoxShadow(
          color: KAppColor.primaryColor.withOpacity(0.3),
          blurRadius: 10,
        ),
      ],
      backgroundColor: KAppColor.surfaceColor,
      items: bottomNavItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return FlashyTabBarItem(
          icon: Icon(item.icon),
          title: Text(
            item.label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: _selectedIndex == index
                      ? KAppColor.primaryColor
                      : KAppColor.textColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          activeColor: KAppColor.primaryColor,
          inactiveColor: KAppColor.textColor,
        );
      }).toList(),
    );
  }
}
