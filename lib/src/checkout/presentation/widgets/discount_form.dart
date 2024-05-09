import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DiscountForm extends StatelessWidget {
  const DiscountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enabled: false,
              keyboardAppearance: Brightness.dark,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: KAppColor.onSecondaryColor,
                  ),
              decoration: const InputDecoration(
                hintText: 'Nhập mã giảm giá',
                prefixIcon: Icon(
                  IconsaxPlusLinear.discount_shape,
                  size: 20,
                  color: KAppColor.onSecondaryColor,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onTap: () {
                // show alert this feature is not available
                AppUtil.showSnackBar(
                  context,
                  'Chức năng này hiện không khả dụng',
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              // show alert this feature is not available
              AppUtil.showSnackBar(
                context,
                'Chức năng này hiện không khả dụng',
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: KAppColor.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Áp dụng',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: KAppColor.onPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
