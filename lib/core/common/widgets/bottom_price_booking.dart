import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BottomPriceBooking extends StatefulWidget {
  const BottomPriceBooking({
    required this.ticketPrices,
    required this.title,
    this.onPressed,
    super.key,
  });

  final List<TicketPrice> ticketPrices;
  final String title;
  final void Function()? onPressed;

  @override
  State<BottomPriceBooking> createState() => _BottomPriceBookingState();
}

class _BottomPriceBookingState extends State<BottomPriceBooking> {
  Map<int, int> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return BlocListener<SeatOptionCubit, SeatOptionState>(
      listener: (context, state) {
        if (state is SeatOptionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is SeatOptionCached) {
          context.read<SeatOptionCubit>().getSelectedOptions();
        }

        if (state is SeatOptionLoaded) {
          setState(() {
            selectedOptions = state.selectedOptions;
          });
        }
      },
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: KAppColor.secondaryColor, width: 2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        ).format(price),
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
                    onPressed: widget.onPressed,
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
                      widget.title,
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
      ),
    );
  }

  int get price {
    return selectedOptions.entries.fold(
      0,
      (previousValue, element) {
        final ticketPrice = widget.ticketPrices.firstWhere(
          (ticketPrice) => ticketPrice.id == element.key,
        );
        return previousValue + ticketPrice.price * element.value;
      },
    );
  }
}
