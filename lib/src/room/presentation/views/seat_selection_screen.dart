import 'package:cinemix_ui/src/room/presentation/widgets/body.dart';
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  static const String routeName = '/seat-selection';

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SeatSelectionBody(),
    );
  }
}
