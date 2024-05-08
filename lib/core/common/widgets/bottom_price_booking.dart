import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomPriceBooking extends StatelessWidget {
  const BottomPriceBooking({
    required this.ticketPrices,
    required this.selectedOptions,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final List<TicketPrice> ticketPrices;
  final Map<int, int> selectedOptions;
  final String title;
  final VoidCallback onPressed;

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
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$quantity ghế:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Tổng tiền:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi',
                            symbol: 'VND',
                          ).format(price),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: KAppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
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

  int get quantity {
    return selectedOptions.values.fold(0, (a, b) => a + b);
  }

  int get price {
    return selectedOptions.entries.fold(
      0,
      (previousValue, element) {
        final ticketPrice = ticketPrices.firstWhere(
          (ticketPrice) => ticketPrice.id == element.key,
        );
        return previousValue + ticketPrice.price * element.value;
      },
    );
  }
}
