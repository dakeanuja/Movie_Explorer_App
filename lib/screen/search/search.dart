import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/upcoming/upcoming_bloc.dart';

import '../../model/trending_movie_model.dart';
import '../home/selected_movie_screen.dart';

class MovieSearch extends StatefulWidget {
  const MovieSearch({super.key});

  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  late TextEditingController _controller;
  List<Movie> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    void refresh() {
      context.read<UpcomingBloc>().add(FetchUpcomingMovies());
    }

    void onSearchChanged() {
      final query = _controller.text;

      // Clear suggestions if the query is empty
      if (query.isEmpty) {
        setState(() {
          _suggestions.clear();
        });
        return;
      }

      context.read<UpcomingBloc>().add(SearchMovies(query));
    }

    return Scaffold(
      //appBar: AppBar(title: const Text('Search Movies')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) => onSearchChanged(),
              decoration: InputDecoration(
                labelText: 'Search for popular ',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      _suggestions.clear();
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<UpcomingBloc, UpcomingState>(
                builder: (context, state) {
                  if (state is UpcomingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetUpcomingMovies) {
                    // Update suggestions based on the state
                    _suggestions = state.movies.where((movie) {
                      return movie.title
                          .toLowerCase()
                          .contains(_controller.text.toLowerCase());
                    }).toList();

                    return ListView.builder(
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        if (_suggestions.isEmpty) {
                          return const ListTile(
                              title: Text('No suggestions found.'));
                        }

                        final movie = _suggestions[index];
                        return ListTile(
                          title: Text(movie.title),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectedPopularMovieScreen(
                                          selMovie: movie,
                                          heroTag: 'upcoming-${movie.id}',
                                          initialIndex:
                                              state.movies.indexOf(movie),
                                          movies: state.movies)),
                            );
                          },
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  } else if (state is NoUpcomingMovies) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: refresh,
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.blue),
                        child: const Text("Reload"),
                      ),
                    );
                  }
                  return const Center(child: Text('No movies found.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
