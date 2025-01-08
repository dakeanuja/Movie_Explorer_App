part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingMovies extends NowPlayingState {
  final List<Movie> movies;

  NowPlayingMovies(this.movies);
}

class NoNowPlayingMovies extends NowPlayingState {
  String error;
  NoNowPlayingMovies(this.error);
}
