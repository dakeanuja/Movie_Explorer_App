import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/popular/popular_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';
import 'package:tmdb_movie_app/screen/home/star_rating.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  void initState() {
    super.initState();
    _fetchPopularMovies();
  }

  void _fetchPopularMovies() {
    context.read<PopularBloc>().add(GetPopularMovie());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NoPopularMovies) {
          return Center(
            child: ElevatedButton(
              onPressed: _fetchPopularMovies,
              child: const Text('Reload'),
            ),
          );
        } else if (state is GetPopularMovies) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.73,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return _buildMovieItem(movie);
            },
          );
        }
        return const Center(child: Text('No data'));
      },
    );
  }

  Widget _buildMovieItem(movie) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        // width: 150, // Set your desired width
        // height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white, // Background color of the container
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                fit: BoxFit.fill,
                height: 190,
                // Adjust the height for the image
                width: double.infinity, // Full width of the container
              ),
            ),
            const SizedBox(height: 4),
            Text(
              movie.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            StarRating(
              rating: movie.voteAverage,
              size: 23.0, // Adjust the size of the stars as needed
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _refresh() {
    _fetchPopularMovies();
  }
}
