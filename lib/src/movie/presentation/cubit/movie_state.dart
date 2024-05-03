part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {
  const MovieInitial();
}

final class MovieLoading extends MovieState {
  const MovieLoading();
}

final class MovieListLoaded extends MovieState {
  const MovieListLoaded(this.movies);

  final List<Movie> movies;

  List<Movie> get showingMovies => movies
      .where((movie) => movie.state == MovieStateEnum.showing.value)
      .toList();

  List<Movie> get comingSoonMovies => movies
      .where((movie) => movie.state == MovieStateEnum.comingSoon.value)
      .toList();

  @override
  List<Object> get props => [movies];
}

final class MovieDetailLoaded extends MovieState {
  const MovieDetailLoaded(this.movie);

  final Movie movie;

  @override
  List<Object> get props => [movie];
}

final class MovieError extends MovieState {
  const MovieError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
