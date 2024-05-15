import 'package:cinemix_ui/src/seat/presentation/widgets/seat_selection_body.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({
    required this.showtime,
    required this.selectedOptions,
    super.key,
  });

  static const String routeName = '/seat-selection';

  final Showtime showtime;
  final Map<int, int> selectedOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeatSelectionBody(
        showtime: showtime,
        selectedOptions: selectedOptions,
      ),
    );
  }
}
