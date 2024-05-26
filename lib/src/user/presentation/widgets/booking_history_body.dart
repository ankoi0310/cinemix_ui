import 'package:cinemix_ui/core/common/widgets/dots_loading_widget.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/showtime_info_card.dart';
import 'package:cinemix_ui/src/invoice/presentation/views/invoice_detail_screen.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingHistoryBody extends StatelessWidget {
  const BookingHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserProfileFailed) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is LoadingBookingHistory) {
          return const DotsLoadingWidget();
        }

        if (state is BookingHistoryLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: state.invoices.map((invoice) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          InvoiceDetailScreen.routeName,
                          arguments: invoice,
                        );
                      },
                      child: ShowtimeInfoCard(
                        showtime: invoice.tickets.first.showtime,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
