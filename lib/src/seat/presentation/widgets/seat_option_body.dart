import 'package:cinemix_ui/core/common/widgets/bottom_price_booking.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_card.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/views/seat_selection_screen.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_option_list.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatOptionBody extends StatefulWidget {
  const SeatOptionBody({
    required this.showtime,
    super.key,
  });

  final Showtime showtime;

  @override
  State<SeatOptionBody> createState() => _SeatOptionBodyState();
}

class _SeatOptionBodyState extends State<SeatOptionBody> {
  Map<int, int> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    final showtime = widget.showtime;
    final size = MediaQuery.of(context).size;

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
        BlocListener<SeatOptionCubit, SeatOptionState>(
          listener: (context, state) {
            if (state is SeatOptionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }

            if (state is SeatOptionCached) {
              context.read<SeatOptionCubit>().getSelectedOptions();
            }

            if (state is SeatOptionLoaded) {
              setState(() {
                selectedOptions = state.selectedOptions;
              });
            }
          },
          child: BottomPriceBooking(
            ticketPrices: showtime.room.theater!.ticketPrices,
            selectedOptions: selectedOptions,
            title: 'Tiếp tục',
            onPressed: () {
              if (selectedOptions.isNotEmpty) {
                Navigator.of(context).pushNamed(
                  SeatSelectionScreen.routeName,
                  arguments: {
                    'showtime': showtime,
                    'selectedOptions': selectedOptions,
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Vui lòng chọn ít nhất 1 ghế'),
                  ),
                );
              }
            },
          ),
        ),
        const FloatingBackButton(),
      ],
    );
  }
}
