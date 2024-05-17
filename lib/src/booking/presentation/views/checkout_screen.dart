import 'package:cinemix_ui/src/booking/presentation/cubit/booking_cubit.dart';
import 'package:cinemix_ui/src/booking/presentation/views/booking_success_screen.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/checkout_body.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    required this.showtime,
    required this.selectedSeats,
    required this.selectedOptions,
    super.key,
  });

  static const String routeName = '/checkout';

  final Showtime showtime;
  final List<Seat> selectedSeats;
  final Map<int, int> selectedOptions;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookTicketSuccess) {
          Navigator.pushNamed(
            context,
            BookingSuccessScreen.routeName,
            arguments: context.read<BookingCubit>(),
          );
        }
      },
      child: Scaffold(
        body: CheckoutBody(
          showtime: showtime,
          selectedSeats: selectedSeats,
          selectedOptions: selectedOptions,
        ),
      ),
    );
  }
}
