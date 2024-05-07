import 'package:cinemix_ui/core/common/widgets/bottom_price_booking.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_card.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_option_list.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatOptionBody extends StatefulWidget {
  const SeatOptionBody({super.key});

  @override
  State<SeatOptionBody> createState() => _SeatOptionBodyState();
}

class _SeatOptionBodyState extends State<SeatOptionBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ShowtimeCubit, ShowtimeState>(
      builder: (context, state) {
        if (state is ShowtimeError) {
          return Stack(
            children: [
              Center(
                child: Text(state.message),
              ),
              const FloatingBackButton(),
            ],
          );
        }

        if (state is GettingSelectedShowtime) {
          return const Center(child: CircularProgressIndicator());
        }

        final showtime = (state as GetSelectedShowtimeSuccess).showtime;
        return Stack(
          children: [
            Positioned.fill(
              left: 16,
              right: 16,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.12),
                      MovieDetailCard(movie: showtime.movie),
                      const SizedBox(height: 32),
                      SeatOptionList(
                        ticketPrices: showtime.room.theater!.ticketPrices,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomPriceBooking(
              ticketPrices: showtime.room.theater!.ticketPrices,
              title: 'Tiếp tục',
              onPressed: () {},
            ),
            const FloatingBackButton(),
          ],
        );
      },
    );
  }
}
