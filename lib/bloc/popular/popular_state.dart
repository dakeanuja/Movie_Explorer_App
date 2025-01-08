part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class GetPopularMovies extends PopularState {
  final List<Movie> movies;

  GetPopularMovies(this.movies);
}

class NoPopularMovies extends PopularState {
  String error;
  NoPopularMovies(this.error);
}
