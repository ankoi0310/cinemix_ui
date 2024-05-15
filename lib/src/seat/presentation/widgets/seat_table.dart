import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';
import 'package:cinemix_ui/src/seat/domain/entities/room.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat/seat_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatTable extends StatefulWidget {
  const SeatTable({
    required this.room,
    required this.bookedSeats,
    super.key,
  });

  final Room room;
  final List<Seat> bookedSeats;

  @override
  State<SeatTable> createState() => _SeatTableState();
}

class _SeatTableState extends State<SeatTable> {
  List<Seat> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    final room = widget.room;
    final bookedSeats = widget.bookedSeats;
    return BlocConsumer<SeatCubit, SeatState>(
      listener: (context, state) {
        if (state is SeatCached || state is SeatRemoved) {
          context.read<SeatCubit>().getSelectedSeats();
        }

        if (state is SeatLoaded) {
          setState(() {
            selectedSeats = state.selectedSeats;
          });
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            children: room.rows.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.seats.map((seat) {
                  var color = Colors.transparent;
                  var textColor = Colors.transparent;
                  if (seat.isSeat) {
                    if (bookedSeats.contains(seat)) {
                      color = SeatColor.booked.color;
                    } else if (selectedSeats.contains(seat)) {
                      color = SeatColor.selecting.color;
                      textColor = Colors.black;
                    } else {
                      switch (seat.style) {
                        case SeatStyle.single:
                          color = SeatColor.single.color;
                          textColor = Colors.black;
                        case SeatStyle.couple:
                          color = SeatColor.couple.color;
                          textColor = Colors.black;
                        case SeatStyle.bed:
                          color = SeatColor.bed.color;
                          textColor = Colors.black;
                        case null:
                          break;
                      }
                    }
                  }

                  return GestureDetector(
                    onTap: () async {
                      if (!bookedSeats.contains(seat)) {
                        if (selectedSeats.contains(seat)) {
                          final seats = row.seats
                              .where(
                                (element) =>
                                    element.name == seat.name &&
                                    element.isSeat &&
                                    element.style == seat.style,
                              )
                              .toList();
                          await context
                              .read<SeatCubit>()
                              .removeSelectedSeats(seats: seats);
                        } else {
                          final seats = row.seats
                              .where(
                                (element) =>
                                    element.name == seat.name &&
                                    element.isSeat &&
                                    element.style == seat.style,
                              )
                              .toList();
                          await context
                              .read<SeatCubit>()
                              .cacheSelectedSeats(seats: seats);
                        }
                      }
                    },
                    child: SeatItem(
                      text: seat.name,
                      textColor: textColor,
                      color: color,
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
