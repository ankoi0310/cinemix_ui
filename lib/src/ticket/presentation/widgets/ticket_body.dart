import 'package:flutter/material.dart';

class TicketBody extends StatelessWidget {
  const TicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          left: 16,
          right: 16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.11),
                // ShowtimeInfoCard(showtime: showtime),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
