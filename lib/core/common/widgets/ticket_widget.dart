import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/barcode_widget.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({required this.invoice, super.key});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    final showtime = invoice.tickets.first.showtime;
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: ClipPath(
        clipper: CustomTicketShape(),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              child: Image.network(
                                showtime.movie.posterUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    showtime.movie.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 12),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            IconsaxPlusLinear.clock_1,
                                            color: KAppColor.surfaceColor,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '${showtime.movie.duration} phút',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            IconsaxPlusLinear.video,
                                            color: KAppColor.surfaceColor,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            showtime.movie.genres
                                                .map((e) => e.name)
                                                .join(', '),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: buildShowtimeInfoWithFittedIcon(
                              context,
                              icon: IconsaxPlusLinear.calendar,
                              text: showtime.startTime,
                              secondaryText: showtime.date,
                            ),
                          ),
                          Expanded(
                            child: buildShowtimeInfoWithFittedIcon(
                              context,
                              icon: IconsaxPlusLinear.building,
                              text: showtime.room.name,
                              secondaryText: invoice.tickets
                                  .map((e) => e.seat.name)
                                  .join(', '),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 8),
                        child: Divider(
                          color: KAppColor.surfaceColor,
                          thickness: 1,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                IconsaxPlusLinear.money_send,
                                color: KAppColor.surfaceColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                NumberFormat.currency(
                                  locale: 'vi',
                                  symbol: 'VND',
                                ).format(invoice.total),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: KAppColor.surfaceColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                IconsaxPlusLinear.location,
                                color: KAppColor.surfaceColor,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      showtime.room.theater!.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      showtime.room.theater!.address,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                IconsaxPlusLinear.note,
                                color: KAppColor.surfaceColor,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  'Scan the code below or enter the receipt code '
                                  'at the ticket printer to get your tickets',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CustomPaint(
                painter: CustomDottedHorizontalLine(),
              ),
              BarcodeWidget(code: invoice.code),
            ],
          ),
        ),
      ),
    );
  }

  IntrinsicHeight buildShowtimeInfoWithFittedIcon(
    BuildContext context, {
    required IconData icon,
    required String text,
    String? secondaryText,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FittedBox(
            child: Icon(
              icon,
              color: KAppColor.surfaceColor,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: KAppColor.surfaceColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (secondaryText != null)
                Text(
                  secondaryText,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.surfaceColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDottedHorizontalLine extends CustomPainter {
  CustomDottedHorizontalLine() {
    _paint
      ..color = Colors.black //dots color
      ..strokeWidth = 2 //dots thickness
      ..strokeCap = StrokeCap.square; //dots corner edges
  }
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i + 0, 0), Offset(i + 10, 0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
