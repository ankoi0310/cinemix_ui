import 'package:cinemix_ui/core/common/views/loading_view.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/coming_soon_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/custom_search_bar.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/showing_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/welcome_header.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().searchMovie();
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieError) {
          return const Center(
            child: Text('Không thể tải danh sách phim đang chiếu'),
          );
        }

        if (state is MovieLoading) {
          return const LoadingView();
        }

        return const SingleChildScrollView(
          child: Column(
            children: [
              WelcomeHeader(),
              SizedBox(height: 12),
              CustomSearchBar(),
              SizedBox(height: 24),
              ShowingWidget(),
              SizedBox(height: 24),
              ComingSoonWidget(),
            ],
          ),
        );
      },
    );
  }
}
