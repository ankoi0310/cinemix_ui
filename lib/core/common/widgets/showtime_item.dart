import 'package:flutter/material.dart';

class ShowtimeItem extends StatelessWidget {
  const ShowtimeItem({
    required this.time,
    this.isSelected = false,
    super.key,
  });

  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.onBackground,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          time,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
