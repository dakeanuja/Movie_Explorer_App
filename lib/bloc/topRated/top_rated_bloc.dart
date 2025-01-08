import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/trending_movie_model.dart';
import '../../repository/trending_movie_repository.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<TopRatedEvent>((event, emit) async {
      emit(TopRatedLoading());
      try {
        final movies = await MovieRepository.fetchTopRated();
        emit(GetTopRatedMovies(movies));
      } catch (e) {
        emit(NoTopRatedMovies('$e'));
      }
    });
  }
}
