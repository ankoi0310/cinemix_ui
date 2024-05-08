import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

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
                  text: 'Hi, ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: 'Koi ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '👋',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Welcome back',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w900,
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
