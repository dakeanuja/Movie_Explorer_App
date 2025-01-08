import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(navIndex: 0)) {
    on<NavigationEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavigationInitial(navIndex: event.navIndex));
      }
    });
  }
}
