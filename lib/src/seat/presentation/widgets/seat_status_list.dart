import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';
import 'package:flutter/material.dart';

class SeatStatusList extends StatelessWidget {
  const SeatStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Wrap(
        spacing: 24,
        runSpacing: 8,
        children: SeatColor.values
            .map(
              (status) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: status.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    status.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
