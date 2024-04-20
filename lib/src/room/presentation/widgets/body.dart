import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';
import 'package:cinemix_ui/src/room/presentation/widgets/seat_table.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: KAppColor.secondaryColor),
                          ),
                          child: Container(
                            color: KAppColor.secondaryColor,
                            margin: const EdgeInsets.all(1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          SeatState.available.nameVN,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: KAppColor.primaryColor),
                          ),
                          child: Container(
                            color: KAppColor.primaryColor,
                            margin: const EdgeInsets.all(1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          SeatState.selected.nameVN,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: KAppColor.secondaryColor.withOpacity(0.5),
                            ),
                          ),
                          child: Container(
                            color: KAppColor.secondaryColor.withOpacity(0.5),
                            margin: const EdgeInsets.all(1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          SeatState.booked.nameVN,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 16,
          right: 16,
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: KAppColor.secondaryColor,
                  width: 3,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tổng tiền',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'vi',
                          symbol: 'VND',
                        ).format(120000),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: KAppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: KAppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: Text(
                      'Tiếp tục',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
