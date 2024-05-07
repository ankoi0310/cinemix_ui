import 'package:cinemix_ui/src/seat/presentation/widgets/seat_option_body.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatOptionScreen extends StatelessWidget {
  const SeatOptionScreen({
    super.key,
  });

  static const String routeName = '/seat-option';

  @override
  Widget build(BuildContext context) {
    context.read<ShowtimeCubit>().getSelectedShowtime();
    return const Scaffold(
      body: SeatOptionBody(),
    );
  }
}
