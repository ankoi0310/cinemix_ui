import 'package:cinemix_ui/src/seat/presentation/widgets/seat_option_body.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';

class SeatOptionScreen extends StatelessWidget {
  const SeatOptionScreen({
    required this.showtime,
    super.key,
  });

  static const String routeName = '/seat-option';

  final Showtime showtime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeatOptionBody(showtime: showtime),
    );
  }
}
