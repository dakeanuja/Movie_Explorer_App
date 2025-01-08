import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/nowPlaying/now_playing_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';

class NowPlayingMovieScreen extends StatefulWidget {
  const NowPlayingMovieScreen({super.key});

  @override
  State<NowPlayingMovieScreen> createState() => _NowPlayingMovieScreen();
}

class _NowPlayingMovieScreen extends State<NowPlayingMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingBloc>().add(GetNowPlayingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
        builder: (context, state) {
      if (state is NowPlayingLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NoNowPlayingMovies) {
        return Center(
            child: ElevatedButton(
                onPressed: _reload, child: const Text('Reload')));
        //return Center(child: Text('Error: ${state.error}'));
      } else if (state is NowPlayingMovies) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.movies.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movie = state.movies[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  //Text('Popular Movies'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedPopularMovieScreen(
                            selMovie: movie,
                            heroTag: 'now_playing-${movie.id}',
                            initialIndex: state.movies.indexOf(movie),
                            movies: state.movies,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'now_playing-${movie.id}',
                      child: Container(
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${movie.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            );
          },
        );
      }
      return const Center(child: Text('No data'));
    });
  }

  void _reload() {
    context.read<NowPlayingBloc>().add(GetNowPlayingMovies());
  }
}
