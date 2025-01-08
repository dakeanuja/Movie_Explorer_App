import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

// theme_bloc.dart

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // Default initial theme is light
  ThemeBloc() : super(ThemeInitial(themeMode: ThemeMode.light)) {
    on<ToggleThemeEvent>((event, emit) {
      final currentThemeMode = state is ThemeInitial
          ? (state as ThemeInitial).themeMode
          : ThemeMode.light;

      // Toggle between light and dark theme
      final newThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;

      // Emit the new theme mode
      emit(ThemeInitial(themeMode: newThemeMode));
    });
  }
}
