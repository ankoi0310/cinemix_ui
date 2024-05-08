import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:intl/intl.dart';

class SeatOptionItem extends StatefulWidget {
  const SeatOptionItem({
    required this.ticketPrice,
    super.key,
  });

  final TicketPrice ticketPrice;

  @override
  State<SeatOptionItem> createState() => _SeatOptionItemState();
}

class _SeatOptionItemState extends State<SeatOptionItem> {
  final maxQty = 10;

  bool isDisabled = false;
  int currentQty = 0;
  TicketPrice get ticketPrice => widget.ticketPrice;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SeatOptionCubit, SeatOptionState>(
      listener: (context, state) {
        if (state is SeatOptionLoaded) {
          final totalQuantity = state.totalQuantity;

          setState(() {
            isDisabled = totalQuantity >= maxQty;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: KAppColor.primaryColor.withOpacity(0.2),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${ticketPrice.seatStyle.title.toUpperCase()} ${ticketPrice.name}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: 'vi',
                      symbol: '₫',
                    ).format(ticketPrice.price),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  InputQty.int(
                    key: ValueKey(ticketPrice.id),
                    initVal: 0,
                    maxVal: maxQty,
                    qtyFormProps: const QtyFormProps(
                      showCursor: false,
                      enableTyping: false,
                      style: TextStyle(
                        color: KAppColor.primaryColor,
                      ),
                    ),
                    decoration: QtyDecorationProps(
                      minusBtn: buildBtn(
                        icon: Icons.remove,
                        isDisabled: currentQty == 0,
                      ),
                      plusBtn: buildBtn(
                        icon: Icons.add,
                        isDisabled: currentQty == maxQty || isDisabled,
                      ),
                    ),
                    onQtyChanged: (qty) {
                      setState(() {
                        currentQty = qty as int;
                      });

                      context.read<SeatOptionCubit>().cacheSelectedOptions(
                            ticketPriceId: ticketPrice.id,
                            quantity: qty as int,
                          );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildBtn({
    required IconData icon,
    bool isDisabled = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isDisabled ? Colors.grey : KAppColor.primaryColor,
        ),
      ),
      child: Icon(
        icon,
        color: isDisabled ? Colors.grey : KAppColor.primaryColor,
      ),
    );
  }
}
