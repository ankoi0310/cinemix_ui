import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    required this.imagePath,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.isSelected = false,
    super.key,
  });

  final String imagePath;
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Image.asset(imagePath, height: 48),
          ),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              IconsaxPlusLinear.arrow_right_3,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
