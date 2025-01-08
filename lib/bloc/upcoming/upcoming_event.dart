part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingEvent {}

class FetchUpcomingMovies extends UpcomingEvent {}

class SearchMovies extends UpcomingEvent {
  final String query;

  SearchMovies(this.query);
}
