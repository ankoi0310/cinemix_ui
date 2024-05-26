import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/user/presentation/views/booking_history_screen.dart';
import 'package:flutter/material.dart';

class BookingHistoryButton extends StatelessWidget {
  const BookingHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      color: KAppColor.secondaryColor,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            BookingHistoryScreen.routeName,
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Lịch sử đặt vé',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: KAppColor.onPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
