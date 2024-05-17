import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/presentation/cubit/booking_cubit.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CheckoutButtonWithTimer extends StatelessWidget {
  const CheckoutButtonWithTimer({
    required this.bookingRequest,
    super.key,
  });

  final BookingRequest bookingRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hoàn tất thanh toán của bạn trong',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                TimerCountdown(
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: DateTime.now().add(
                    const Duration(minutes: 10),
                  ),
                  onEnd: () {
                    // Navigate to home screen
                    Navigator.of(context).popUntil(
                      ModalRoute.withName(HomeScreen.routeName),
                    );
                  },
                  enableDescriptions: false,
                  spacerWidth: 4,
                  colonsTextStyle:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: KAppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                  timeTextStyle:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: KAppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<BookingCubit>().createBooking(bookingRequest);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
            ),
            child: Text(
              'Thanh toán',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
