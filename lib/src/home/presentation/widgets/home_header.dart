import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Xin chào, ',
                  style: Theme.of(context).textTheme.titleSmall,
                  children: const [
                    TextSpan(
                      text: 'Koi',
                      style: TextStyle(
                        color: KAppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(text: '👋'),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Chào mừng trở lại!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const Icon(IconsaxPlusBold.notification, size: 32),
        ],
      ),
    );
  }
}
