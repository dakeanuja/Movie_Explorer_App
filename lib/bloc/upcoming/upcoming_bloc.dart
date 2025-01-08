import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_movie_app/repository/trending_movie_repository.dart';

import '../../model/trending_movie_model.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial()) {
    on<UpcomingEvent>((event, emit) async {
      emit(UpcomingLoading());
      try {
        final movies = await MovieRepository.fetchUpcomingMovies();
        emit(GetUpcomingMovies(movies));
      } catch (e) {
        emit(NoUpcomingMovies('$e'));
      }
    });
  }
}
