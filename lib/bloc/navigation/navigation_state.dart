part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final int navIndex;

  const NavigationState({required this.navIndex});
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.navIndex});
}
