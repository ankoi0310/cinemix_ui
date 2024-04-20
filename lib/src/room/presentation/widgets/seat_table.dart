import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';
import 'package:cinemix_ui/src/room/presentation/widgets/seat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatTable extends StatefulWidget {
  const SeatTable({super.key});

  @override
  State<SeatTable> createState() => _SeatTableState();
}

class _SeatTableState extends State<SeatTable> {
  // selected seats
  List<Seat> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          demoRoom.rowCount,
          (rowIndex) => Row(
            children: List.generate(demoRoom.columnCount, (columnIndex) {
              Seat? seat;

              for (var i = 0; i < demoRoom.seats.length; i++) {
                if (demoRoom.seats[i].rowIndex == rowIndex &&
                    demoRoom.seats[i].columnIndex == columnIndex) {
                  seat = demoRoom.seats[i];
                  break;
                }
              }

              return seat == null
                  ? Container()
                  : SeatItem(
                      seat: seat,
                      isSelected: selectedSeats.contains(seat) ||
                          (seat.ref != null &&
                              selectedSeats.contains(seat.ref)),
                      onTap: () {
                        setState(() {
                          // TODO(seat): Update cache for selected seats
                          if (selectedSeats.contains(seat)) {
                            selectedSeats.remove(seat);
                          } else {
                            selectedSeats.add(seat!);
                          }
                        });
                      },
                    );
            }),
          ),
        ),
      ),
    );
  }
}
