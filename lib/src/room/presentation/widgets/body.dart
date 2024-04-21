import 'package:cinemix_ui/core/common/widgets/bottom_price_booking.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/common/widgets/showtime_item.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/room/presentation/widgets/seat_table.dart';
import 'package:cinemix_ui/src/room/presentation/widgets/seat_type.dart';
import 'package:flutter/material.dart';

class SeatSelectionBody extends StatelessWidget {
  const SeatSelectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 120,
          left: 16,
          right: 16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: KAppColor.primaryColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 84,
                  width: size.width,
                  child:
                      const CustomPaint(painter: IsoscelesTrapezoidPainter()),
                ),
                const SizedBox(height: 16),
                const SeatTable(),
                const SizedBox(height: 24),
                const SeatTypeWidget(),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      'Chọn suất chiếu',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ShowtimeItem(time: '07:00', isSelected: true),
                          ShowtimeItem(time: '09:00'),
                          ShowtimeItem(time: '09:00'),
                          ShowtimeItem(time: '09:00'),
                          ShowtimeItem(time: '09:00'),
                          ShowtimeItem(time: '09:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        BottomPriceBooking(
          price: 120000,
          title: 'Tiếp tục',
          onPressed: () {},
        ),
        const FloatingBackButton(),
      ],
    );
  }
}

class IsoscelesTrapezoidPainter extends CustomPainter {
  const IsoscelesTrapezoidPainter({
    this.color = KAppColor.primaryColor,
    this.height = 84,
    this.padding = 20,
  });

  final Color color;
  final double height;
  final double padding;

  @override
  void paint(Canvas canvas, Size size) {
    // gradient color from top to bottom
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.1, 1],
        colors: [
          KAppColor.primaryColor.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Offset.zero & size);

    // draw rectangle
    final path = Path()
      ..moveTo(padding, 0)
      ..lineTo(size.width - padding, 0)
      ..lineTo(size.width, height)
      ..lineTo(0, height)
      ..close(); // Closing the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
