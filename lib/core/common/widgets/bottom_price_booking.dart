import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomPriceBooking extends StatelessWidget {
  const BottomPriceBooking({
    required this.price,
    required this.title,
    this.onPressed,
    super.key,
  });

  final int price;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: KAppColor.secondaryColor, width: 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'vi',
                        symbol: 'VND',
                      ).format(price),
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: KAppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: KAppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
