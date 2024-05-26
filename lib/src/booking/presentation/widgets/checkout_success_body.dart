import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/src/booking/presentation/cubit/booking_cubit.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/booking_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSuccessBody extends StatelessWidget {
  const CheckoutSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is CompletePaymentFail) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is CompletingPayment) {
          return const CircleLoading();
        }

        if (state is PaymentCompleted) {
          return BookingInfo(invoice: state.invoice);
        }

        return const SizedBox();
      },
    );
  }
}
