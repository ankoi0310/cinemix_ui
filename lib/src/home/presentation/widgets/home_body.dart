import 'package:cinemix_ui/src/home/presentation/widgets/coming_soon_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/home_header.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_search_form.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/showing_widget.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/views/movie_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MovieCubit>().searchMovie();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 12,
                right: 16,
                bottom: 24,
              ),
              // 1. User clicks on the movie search form
              child: MovieSearchForm(
                onSubmitted: (value) {
                  // 7. The application navigates to the movie search screen
                  // with the keyword
                  Navigator.of(context).pushNamed(
                    MovieSearchScreen.routeName,
                    arguments: value,
                  );
                },
              ),
            ),
            const ShowingWidget(),
            const SizedBox(height: 24),
            const ComingSoonWidget(),
          ],
        ),
      ),
    );
  }
}
