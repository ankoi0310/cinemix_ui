import 'package:cinemix_ui/core/common/widgets/dots_loading_widget.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
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
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          top: size.height * 0.12,
          left: 16,
          right: 16,
          child: BlocConsumer<MovieCubit, MovieState>(
            listener: (context, state) {
              if (state is MovieError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }

              if (state is MovieListLoaded) {
                if (state.showingMovies.isEmpty &&
                    state.comingSoonMovies.isNotEmpty) {
                  _tabController.animateTo(1);
                }
              }
            },
            builder: (context, state) {
              if (state is MovieLoading) {
                return const DotsLoadingWidget();
              }

              return Column(
                children: [
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

                            if (state is MovieListLoaded) {
                              return MovieSearchGridView(
                                movies: state.showingMovies,
                              );
                            }

                            return const MovieSearchGridView(movies: []);
                          },
                        ),
                        BlocBuilder<MovieCubit, MovieState>(
                          builder: (context, state) {
                            if (state is MovieError) {
                              return const Center(
                                child: Text('Xảy ra lỗi khi tìm kiếm phim'),
                              );
                            }

                            if (state is MovieListLoaded) {
                              return MovieSearchGridView(
                                movies: state.comingSoonMovies,
                              );
                            }

                            return const MovieSearchGridView(movies: []);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        FloatingBackButton(
          title: 'Tìm kiếm phim',
        ),
      ],
    );
  }
}
