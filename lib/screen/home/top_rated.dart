import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/topRated/top_rated_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({super.key});

  @override
  State<TopRatedScreen> createState() => _TopRatedScreen();
}

class _TopRatedScreen extends State<TopRatedScreen> {
  //@override
  // void initState() {
  //   super.initState();
  //   context.read<TopRatedBloc>().add(GetTopRatedMovie());
  // }
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    context.read<TopRatedBloc>().add(GetTopRatedMovie());
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose(); // Dispose the PageController
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final state = context.read<TopRatedBloc>().state;
      if (state is GetTopRatedMovies) {
        setState(() {
          _currentPage = (_currentPage + 1) % state.movies.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedBloc, TopRatedState>(builder: (context, state) {
      if (state is TopRatedLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NoTopRatedMovies) {
        return Center(
          child: ElevatedButton(
            onPressed: _refresh,
            child: Text('Reload'),
          ),
        );
      } else if (state is GetTopRatedMovies) {
        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: state.movies.length,
          //shrinkWrap: true,
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
                              heroTag: 'top_rated-${movie.id}',
                              initialIndex: state.movies.indexOf(movie),
                              movies: state.movies),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'top_rated-${movie.id}',
                      child: Container(
                        height: 210,
                        width: 350,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  // Text('${movie.title}',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //     )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.movies.length, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _currentPage = index;
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: _buildDotIndicator(index),
                      );
                    }),
                  ),
                  SizedBox(height: 5),
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

  void _refresh() {
    context.read<TopRatedBloc>().add(GetTopRatedMovie());
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: index == _currentPage ? 8.0 : 6.0,
      height: index == _currentPage ? 8.0 : 6.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage ? Colors.deepPurple : Colors.grey,
      ),
    );
  }
}
