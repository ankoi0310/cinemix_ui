import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/checkout_button_with_timer.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/showtime_info_card.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/theater_info.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    required this.showtime,
    required this.selectedSeats,
    required this.selectedOptions,
    super.key,
  });

  final Showtime showtime;
  final List<Seat> selectedSeats;
  final Map<int, int> selectedOptions;

  @override
  Widget build(BuildContext context) {
    final total = AppUtil.getTotalPrice(
      selectedOptions: selectedOptions,
      ticketPrices: showtime.room.theater!.ticketPrices,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ShowtimeInfoCard(showtime: showtime),
                const SizedBox(height: 32),
                TheaterInfo(
                  roomName: showtime.room.name,
                  selectedSeats: selectedSeats
                      .map((seat) => seat.name)
                      .toSet()
                      .toList()
                      .join(', '),
                  totalPrice: total,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          const Spacer(),
          CheckoutButtonWithTimer(
            bookingRequest: BookingRequest(
              code: AppUtil.getCurrentUnixTimestamp(),
              showtime: showtime as ShowtimeModel,
              seats: selectedSeats as List<SeatModel>,
              total: total,
            ),
          ),
        ],
      ),
    );
  }
}
