import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatefulWidget {
  const SeatItem({
    required this.seat,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final Seat seat;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  State<SeatItem> createState() => _SeatItemState();
}

class _SeatItemState extends State<SeatItem> {
  @override
  Widget build(BuildContext context) {
    final seat = widget.seat;
    final isSelected = widget.isSelected;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? KAppColor.primaryColor
                : seat.isSeat
                    ? KAppColor.secondaryColor
                    : Colors.transparent,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: isSelected
                ? KAppColor.primaryColor
                : seat.isSeat
                    ? KAppColor.secondaryColor
                    : Colors.transparent,
          ),
          child: Center(
            child: Text(
              seat.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
