import 'package:cinemix_ui/core/common/widgets/custom_icon.dart';
import 'package:cinemix_ui/core/common/widgets/custom_text.dart';
import 'package:cinemix_ui/core/res/viewmodel/nav_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  NavItem _selectedItem = bottomNavItems[0];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomAppBar(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildItem(item: bottomNavItems[0]),
            buildItem(item: bottomNavItems[1]),
            buildItem(item: bottomNavItems[2]),
            buildItem(item: bottomNavItems[3]),
          ],
        ),
      ),
    );
  }

  Widget buildItem({
    required NavItem item,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedItem = item;
          });

          // Navigator.pushNamed(context, item.route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kNavIcon(
              context,
              icon: _selectedItem == item ? item.activeIcon : item.icon,
              isActive: _selectedItem == item,
            ),
            const SizedBox(height: 8),
            kNavLabel(
              context,
              label: item.label,
              isActive: _selectedItem == item,
            ),
          ],
        ),
      ),
    );
  }
}
