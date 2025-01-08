part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class TabChange extends NavigationEvent {
  final int navIndex;

  TabChange({required this.navIndex});
}
