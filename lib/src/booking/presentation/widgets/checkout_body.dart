import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/checkout_button_with_timer.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/payment_method_widget.dart';
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
    final size = MediaQuery.of(context).size;

    final total = AppUtil.getTotalPrice(
      selectedOptions: selectedOptions,
      ticketPrices: showtime.room.theater!.ticketPrices,
    );

    return Stack(
      children: [
        Positioned.fill(
          bottom: 144,
          left: 16,
          right: 16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.12),
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
                const PaymentMethodWidget(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CheckoutButtonWithTimer(
            bookingRequest: BookingRequest(
              showtime: showtime as ShowtimeModel,
              seats: selectedSeats as List<SeatModel>,
              total: total,
            ),
          ),
        ),
        const FloatingBackButton(),
      ],
    );
  }
}
