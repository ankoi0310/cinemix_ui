import 'package:cinemix_ui/core/common/widgets/bottom_price_booking.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat/seat_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_status_list.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_table.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/showtime_list.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatSelectionBody extends StatelessWidget {
  const SeatSelectionBody({
    required this.showtime,
    required this.selectedOptions,
    super.key,
  });

  final Showtime showtime;
  final Map<int, int> selectedOptions;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          bottom: 120,
          left: 16,
          right: 16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: KAppColor.primaryColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 84,
                  width: size.width,
                  child:
                      const CustomPaint(painter: IsoscelesTrapezoidPainter()),
                ),
                const SizedBox(height: 16),
                Center(
                  child: SeatTable(
                    room: showtime.room,
                    bookedSeats: showtime.bookedSeats,
                  ),
                ),
                const SizedBox(height: 24),
                const SeatStatusList(),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chọn suất chiếu',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ShowtimeList(
                      movie: showtime.movie.id,
                      date: showtime.date,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<SeatCubit, SeatState>(
          builder: (context, state) {
            if (state is SeatLoaded) {
              final selectedSeats = state.selectedSeats;
              return BottomPriceBooking(
                ticketPrices: showtime.room.theater!.ticketPrices,
                selectedOptions: selectedOptions,
                selectedSeats: selectedSeats,
                title: 'Tiếp tục',
                onPressed: () {
                  // TODO(checkout): navigate to checkout screen
                  Navigator.of(context).pushNamed(
                    '/checkout',
                    arguments: {
                      'showtime': showtime,
                      'selectedSeats': selectedSeats,
                      'selectedOptions': selectedOptions,
                    },
                  );
                },
              );
            }

            return BottomPriceBooking(
              ticketPrices: showtime.room.theater!.ticketPrices,
              selectedOptions: selectedOptions,
              title: 'Tiếp tục',
              onPressed: () {},
            );
          },
        ),
        const FloatingBackButton(),
      ],
    );
  }
}

class IsoscelesTrapezoidPainter extends CustomPainter {
  const IsoscelesTrapezoidPainter({
    this.color = KAppColor.primaryColor,
    this.height = 84,
    this.padding = 20,
  });

  final Color color;
  final double height;
  final double padding;

  @override
  void paint(Canvas canvas, Size size) {
    // gradient color from top to bottom
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.1, 1],
        colors: [
          KAppColor.primaryColor.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Offset.zero & size);

    // draw rectangle
    final path = Path()
      ..moveTo(padding, 0)
      ..lineTo(size.width - padding, 0)
      ..lineTo(size.width, height)
      ..lineTo(0, height)
      ..close(); // Closing the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
