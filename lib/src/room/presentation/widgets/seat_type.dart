import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';
import 'package:flutter/material.dart';

class SeatTypeWidget extends StatelessWidget {
  const SeatTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSeatType(
          context,
          state: SeatState.available,
          color: KAppColor.secondaryColor,
        ),
        buildSeatType(
          context,
          state: SeatState.selected,
          color: KAppColor.primaryColor,
        ),
        buildSeatType(
          context,
          state: SeatState.booked,
          color: KAppColor.secondaryColor.withOpacity(0.5),
        ),
      ],
    );
  }

  Row buildSeatType(
    BuildContext context, {
    required SeatState state,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: color),
          ),
          child: Container(
            color: color,
            margin: const EdgeInsets.all(1),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          state.nameVN,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
