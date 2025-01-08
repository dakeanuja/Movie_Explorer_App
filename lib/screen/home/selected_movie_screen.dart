import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/screen/home/star_rating.dart';
import '../../model/trending_movie_model.dart';

class SelectedPopularMovieScreen extends StatelessWidget {
  const SelectedPopularMovieScreen(
      {super.key,
      required this.selMovie,
      required this.initialIndex,
      required this.heroTag,
      required this.movies});

  final Movie selMovie;
  final String heroTag;
  final List<Movie> movies;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selMovie.title),
      ),
      body: PageView.builder(
        itemCount: movies.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          final selMovie = movies[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Image for the movie poster
                  Hero(
                    tag: heroTag,
                    child: Center(
                      child: Container(
                        height: 350,
                        width: 250,
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
                                'https://image.tmdb.org/t/p/w500/${selMovie.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Overview Section
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Overview : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: selMovie.overview,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Rating Section
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rating:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Star Rating Widget
                  StarRating(
                    rating: selMovie.voteAverage,
                    size: 35.0,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
