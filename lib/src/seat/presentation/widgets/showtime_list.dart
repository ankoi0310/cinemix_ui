import 'package:cinemix_ui/core/common/widgets/dots_loading_widget.dart';
import 'package:cinemix_ui/core/common/widgets/showtime_item.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowtimeList extends StatefulWidget {
  const ShowtimeList({
    required this.movie,
    required this.date,
    super.key,
  });

  final int movie;
  final String date;

  @override
  State<ShowtimeList> createState() => _ShowtimeListState();
}

class _ShowtimeListState extends State<ShowtimeList> {
  List<Showtime> showtimes = [];

  @override
  void initState() {
    super.initState();
    context
        .read<ShowtimeCubit>()
        .searchShowtime(movie: widget.movie, date: widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowtimeCubit, ShowtimeState>(
      listener: (context, state) {
        if (state is ShowtimeListLoaded) {
          setState(() {
            showtimes = state.showtimes;
          });
        }
      },
      builder: (context, state) {
        if (state is ShowtimeError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is ShowtimeLoading) {
          return const DotsLoadingWidget();
        }

        return showtimes.isEmpty
            ? const Center(
                child: Text('Không có suất chiếu'),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: showtimes
                      .map(
                        (showtime) => ShowtimeItem(
                          time: showtime.startTime,
                          onTap: () {
                            context
                                .read<ShowtimeCubit>()
                                .cacheSelectedShowtime(showtime)
                                .then((_) {});
                          },
                        ),
                      )
                      .toList(),
                ),
              );
      },
    );
  }
}
