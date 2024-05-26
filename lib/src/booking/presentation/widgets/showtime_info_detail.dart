import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/ticket/domain/entities/ticket.dart';
import 'package:flutter/material.dart';

class ShowtimeInfoDetail extends StatelessWidget {
  const ShowtimeInfoDetail({required this.tickets, super.key});

  final List<Ticket> tickets;

  @override
  Widget build(BuildContext context) {
    final showtime = tickets.first.showtime;

    return Container(
      decoration: BoxDecoration(
        color: KAppColor.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin đặt vé',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: KAppColor.textColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tên phim: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  showtime.movie.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Suất chiếu: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  '${showtime.startTime} - ${showtime.date}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Rạp chiếu: ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: KAppColor.textColor.withOpacity(0.5),
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    showtime.room.theater!.name,
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: KAppColor.textColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phòng chiếu:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  showtime.room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ghế:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  tickets.map((e) => e.seat.name).join(', '),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
