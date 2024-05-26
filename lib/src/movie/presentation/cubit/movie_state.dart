part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {
  const MovieInitial();
}

final class SearchingMovie extends MovieState {
  const SearchingMovie();
}

final class SearchMovieSuccess extends MovieState {
  const SearchMovieSuccess(this.movies);

  final List<Movie> movies;

  // 16. The application filters out the showing movies and coming soon movies
  List<Movie> get showingMovies => movies
      .where((movie) => movie.state == movie_enum.MovieState.showing.value)
      .toList();
  List<Movie> get comingSoonMovies => movies
      .where((movie) => movie.state == movie_enum.MovieState.comingSoon.value)
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
