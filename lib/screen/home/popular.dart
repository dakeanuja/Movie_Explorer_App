import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/popular/popular_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';

//
// class PopularMovieScreen extends StatefulWidget {
//   const PopularMovieScreen({super.key});
//
//   @override
//   State<PopularMovieScreen> createState() => _PopularMovieScreenState();
// }
//
// class _PopularMovieScreenState extends State<PopularMovieScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<PopularBloc>().add(GetPopularMovie());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PopularBloc, PopularState>(builder: (context, state) {
//       if (state is PopularLoading) {
//         return const Center(child: CircularProgressIndicator());
//       }
//       // else if (state is NoPopularMovies) {
//       //   return Center(child: Text('Error: ${state.error}'));
//       // }
//       else if (state is NoPopularMovies) {
//         return Center(
//           child: ElevatedButton(
//             onPressed: _refresh,
//             child: Text('Reload'),
//           ),
//         );
//       } else if (state is GetPopularMovies) {
//         return Hero(
//           tag: 'animate',
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: state.movies.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final movie = state.movies[index];
//               return Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Column(
//                   children: [
//                     //Text('Popular Movies'),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SelectedPopularMovieScreen(
//                               selMovie: movie,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 345,
//                         width: 240,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
//                                 fit: BoxFit.cover)),
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text('${movie.title}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       }
//       return const Center(child: Text('No data'));
//     });
//   }
//
//   void _refresh() {
//     context.read<PopularBloc>().add(GetPopularMovie());
//   }
// }
class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PopularBloc>().add(GetPopularMovie());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(builder: (context, state) {
      if (state is PopularLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NoPopularMovies) {
        return Center(
          child: ElevatedButton(
            onPressed: _refresh,
            child: Text('Reload'),
          ),
        );
      } else if (state is GetPopularMovies) {
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
                              heroTag: 'popular-${movie.id}',
                              initialIndex: state.movies.indexOf(movie),
                              movies: state.movies),
                        ),
                      );
                    },
                    child: Hero(
                      tag:
                          'popular-${movie.id}', // Use a unique tag for each movie
                      child: Container(
                        height: 345,
                        width: 240,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('${movie.title}',
                      style: TextStyle(
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
    context.read<PopularBloc>().add(GetPopularMovie());
  }
}
