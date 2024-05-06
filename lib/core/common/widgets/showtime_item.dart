import 'package:flutter/material.dart';

class ShowtimeItem extends StatelessWidget {
  const ShowtimeItem({
    required this.time,
    required this.onTap,
    super.key,
  });

  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          time,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
