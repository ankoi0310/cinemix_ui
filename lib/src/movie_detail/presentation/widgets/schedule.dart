import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final dates = DateUtil.getUpcomingDates(7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Lịch chiếu', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: dates.entries.map((entry) {
              return Container(
                width: 100,
                margin: EdgeInsets.only(
                  right: dates.entries.last.value == entry.value ? 0 : 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      Text(
                        entry.key,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        entry.value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
