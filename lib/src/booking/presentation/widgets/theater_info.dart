import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/discount_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TheaterInfo extends StatelessWidget {
  const TheaterInfo({
    required this.roomName,
    required this.selectedSeats,
    required this.totalPrice,
    super.key,
  });

  final String roomName;
  final String selectedSeats;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phòng chiếu',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              roomName,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ghế',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              selectedSeats,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const DiscountForm(),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 12,
          ),
          child: Divider(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            thickness: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tổng cộng',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              NumberFormat.currency(
                locale: 'vi',
                symbol: 'VNĐ',
              ).format(totalPrice),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: KAppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
