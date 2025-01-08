import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/routes/generated_routes.dart';
import 'package:tmdb_movie_app/theme/dark.dart';
import 'package:tmdb_movie_app/theme/light.dart';
import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/theme/theme_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(title: 'MyApp'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                NavigationBloc(), // Create NavigationBloc instance
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, ThemeState) {
            final themeMode = ThemeState is ThemeInitial
                ? ThemeState.themeMode
                : ThemeMode.light;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: title,
              themeMode: themeMode,
              theme: LightTheme.theme,
              darkTheme: DarkTheme.darktheme,
              initialRoute: '/',
              onGenerateRoute: RouteGenarator().generateRoute,
            );
          },
        ));
  }
}
//A simple app that fetches and displays movie show details using the TMDb API, including ratings, description and posters.
