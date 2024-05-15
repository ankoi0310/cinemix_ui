import 'package:cinemix_ui/src/checkout/presentation/widgets/barcode_widget.dart';
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: ClipPath(
        clipper: CustomTicketShape(),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(24),
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
                      // MovieInfoCard(movie: showtime.movie),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildShowtimeInfoWithFittedIcon(
                          //   context,
                          //   icon: IconsaxPlusLinear.calendar,
                          //   text: showtime.startTime,
                          //   secondaryText: showtime.startTime,
                          // ),
                          // buildShowtimeInfoWithFittedIcon(
                          //   context,
                          //   icon: IconsaxPlusLinear.building,
                          //   text: showtime.room.theater.name,
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CustomPaint(
                painter: CustomDottedHorizontalLine(),
              ),
              const BarcodeWidget(),
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
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
              if (secondaryText != null)
                Text(
                  secondaryText,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
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
