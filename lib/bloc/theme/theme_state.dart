part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  final ThemeMode themeMode;

  ThemeInitial({required this.themeMode});
}
