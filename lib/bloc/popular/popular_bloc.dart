import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/trending_movie_model.dart';
import '../../repository/trending_movie_repository.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularMovieEvent, PopularState> {
  PopularBloc() : super(PopularInitial()) {
    on<PopularMovieEvent>((event, emit) async {
      emit(PopularLoading());
      try {
        final movies = await MovieRepository.fetchPopularMovies();
        emit(GetPopularMovies(movies));
      } catch (e) {
        emit(NoPopularMovies('$e'));
      }
    });
  }
}
