part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class GetUpcomingMovies extends UpcomingState {
  final List<Movie> movies;

  GetUpcomingMovies(this.movies);
}

class NoUpcomingMovies extends UpcomingState {
  String error;
  NoUpcomingMovies(this.error);
}
