import 'package:cinemix_ui/core/common/widgets/dots_loading_widget.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_search_form.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_search_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSearchBody extends StatefulWidget {
  const MovieSearchBody({super.key});

  @override
  State<MovieSearchBody> createState() => _MovieSearchBodyState();
}

class _MovieSearchBodyState extends State<MovieSearchBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state is MovieError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is SearchMovieSuccess) {
          if (state.showingMovies.isEmpty &&
              state.comingSoonMovies.isNotEmpty) {
            _tabController.animateTo(1);
          }
        }
      },
      builder: (context, state) {
        // 10. The application displays the loading indicator when
        // searching for movies
        if (state is SearchingMovie) {
          return const DotsLoadingWidget();
        }

        // 18. The application displays the showing and coming soon movies
        if (state is SearchMovieSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              children: [
                MovieSearchForm(
                  onSubmitted: (value) {
                    context.read<MovieCubit>().searchMovie(keyword: value);
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: KAppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: KAppColor.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: KAppColor.onPrimaryColor,
                    unselectedLabelColor: KAppColor.onSecondaryColor,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(text: 'Đang chiếu'),
                      Tab(text: 'Sắp chiếu'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // 18. The application displays the list of movies
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) {
                          if (state is MovieError) {
                            return const Center(
                              child: Text('Xảy ra lỗi khi tìm kiếm phim'),
                            );
                          }

                          if (state is SearchMovieSuccess) {
                            return MovieSearchGridView(
                              movies: state.showingMovies,
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                      BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) {
                          if (state is MovieError) {
                            return const Center(
                              child: Text('Xảy ra lỗi khi tìm kiếm phim'),
                            );
                          }

                          if (state is SearchMovieSuccess) {
                            // 16. The application displays the coming soon movies
                            return MovieSearchGridView(
                              movies: state.comingSoonMovies,
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
