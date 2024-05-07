import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';
import 'package:cinemix_ui/src/seat/domain/entities/room.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_item.dart';
import 'package:flutter/material.dart';

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
  List<Seat> selectingSeats = [];

  @override
  Widget build(BuildContext context) {
    final room = widget.room;
    final bookedSeats = widget.bookedSeats;
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
                } else if (selectingSeats.contains(seat)) {
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
                onTap: () {
                  if (!bookedSeats.contains(seat)) {
                    setState(() {
                      if (selectingSeats.contains(seat)) {
                        selectingSeats.removeWhere((e) => e.name == seat.name);
                      } else {
                        final seats = row.seats
                            .where(
                              (element) =>
                                  element.name == seat.name &&
                                  element.isSeat &&
                                  element.style == seat.style,
                            )
                            .toList();
                        selectingSeats.addAll(seats);
                      }
                    });
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
  }
}
