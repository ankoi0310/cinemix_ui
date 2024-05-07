import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/src/theater/presentation/widgets/theater_accordion.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final dates = DateUtil.getUpcomingDates(7);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Lịch chiếu', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: dates.entries.map((entry) {
              final index = dates.keys.toList().indexOf(entry.key);
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(
                    right: dates.entries.last.value == entry.value ? 0 : 16,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    child: Column(
                      children: [
                        Text(
                          entry.key,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedIndex == index
                                        ? Colors.black
                                        : Colors.white54,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          entry.value.format('dd/MM'),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: _selectedIndex == index
                                        ? Colors.black
                                        : Colors.white54,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        TheaterAccordion(
          date: dates.values.toList()[_selectedIndex],
        ),
      ],
    );
  }
}
