import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/popular/popular_bloc.dart';
import 'package:tmdb_movie_app/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';

class UpcomingMovieScreen extends StatefulWidget {
  const UpcomingMovieScreen({super.key});

  @override
  State<UpcomingMovieScreen> createState() => _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends State<UpcomingMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UpcomingBloc>().add(FetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (context, state) {
      if (state is PopularLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NoUpcomingMovies) {
        //return Center(child: Text('Error: ${state.error}'));
        return Center(
          child: ElevatedButton(onPressed: _reload, child: Text('Reload')),
        );
      } else if (state is GetUpcomingMovies) {
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedPopularMovieScreen(
                                selMovie: movie,
                                heroTag: 'upcoming-${movie.id}',
                                initialIndex: state.movies.indexOf(movie),
                                movies: state.movies)),
                      );
                    },
                    child: Hero(
                      tag: 'upcoming-${movie.id}',
                      child: Container(
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(movie.title,
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
    context.read<UpcomingBloc>().add(FetchUpcomingMovies());
  }
}
