import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/nowPlaying/now_playing_bloc.dart';
import 'package:tmdb_movie_app/bloc/topRated/top_rated_bloc.dart';
import 'package:tmdb_movie_app/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_movie_app/screen/home/popular.dart';
import 'package:tmdb_movie_app/screen/home/top_rated.dart';
import 'package:tmdb_movie_app/screen/home/upcoming.dart';

import '../../bloc/popular/popular_bloc.dart';
import 'now_playing.dart';

class TrendingMovies extends StatelessWidget {
  final List<String> movies;
  const TrendingMovies(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: TabBar(tabs: tabs),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Top Rated',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            SizedBox(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.29,
              child: BlocProvider(
                create: (context) => TopRatedBloc(),
                child: const TopRatedScreen(),
              ),
            ),
            // const Text(
            //   'Popular Movies',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // SizedBox(
            //   //color: Colors.green,
            //   height: MediaQuery.of(context).size.height * 0.45,
            //   child: BlocProvider(
            //     create: (context) => PopularBloc(),
            //     child: const PopularMovieScreen(),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Text(
              'Upcoming Movies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.29,
              child: BlocProvider(
                create: (context) => UpcomingBloc(),
                child: const UpcomingMovieScreen(),
              ),
            ),
            const Text('Now Playing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            SizedBox(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.29,
              child: BlocProvider(
                create: (context) => NowPlayingBloc(),
                child: const NowPlayingMovieScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
