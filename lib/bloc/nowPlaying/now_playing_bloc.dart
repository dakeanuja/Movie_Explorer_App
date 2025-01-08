import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_movie_app/repository/trending_movie_repository.dart';

import '../../model/trending_movie_model.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<NowPlayingEvent>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final movies = await MovieRepository.fetchNowPlayingMovies();
        emit(NowPlayingMovies(movies));
      } catch (e) {
        emit(NoNowPlayingMovies('$e'));
      }
    });
  }
}
