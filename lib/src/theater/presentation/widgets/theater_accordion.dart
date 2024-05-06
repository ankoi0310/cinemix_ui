import 'package:accordion/accordion.dart';
import 'package:cinemix_ui/core/common/widgets/showtime_item.dart';
import 'package:cinemix_ui/src/seat/presentation/views/seat_selection_screen.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TheaterAccordion extends StatelessWidget {
  const TheaterAccordion({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    context.read<ShowtimeCubit>().searchShowtime();

    return BlocBuilder<ShowtimeCubit, ShowtimeState>(
      builder: (context, state) {
        if (state is ShowtimeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final showtimesByTheater =
            (state as ShowtimeListLoaded).showtimesByTheater;
        return Accordion(
          scaleWhenAnimating: false,
          paddingListHorizontal: 0,
          disableScrolling: true,
          paddingListBottom: 0,
          children: showtimesByTheater.entries
              .map(
                (entry) => buildAccordionSection(
                  context,
                  isOpen: true,
                  theater: entry.key,
                  showtimes: entry.value,
                ),
              )
              .toList(),
        );
      },
    );
  }

  AccordionSection buildAccordionSection(
    BuildContext context, {
    required bool isOpen,
    required Theater theater,
    required List<Showtime> showtimes,
  }) {
    return AccordionSection(
      isOpen: isOpen,
      rightIcon: Icon(
        IconsaxPlusLinear.arrow_circle_down,
        size: 24,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      headerBorderRadius: 8,
      headerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      contentBackgroundColor: Theme.of(context).colorScheme.secondary,
      header: Text(
        theater.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(theater.address),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: showtimes
                  .map(
                    (showtime) => ShowtimeItem(
                      time: showtime.startTime,
                      onTap: () {
                        // TODO(showtime): Save to local datasource
                        Navigator.of(context).pushNamed(
                          SeatSelectionScreen.routeName,
                          arguments: showtime,
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
