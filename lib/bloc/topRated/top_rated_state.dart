part of 'top_rated_bloc.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class GetTopRatedMovies extends TopRatedState {
  final List<Movie> movies;

  GetTopRatedMovies(this.movies);
}

class NoTopRatedMovies extends TopRatedState {
  String error;
  NoTopRatedMovies(this.error);
}
