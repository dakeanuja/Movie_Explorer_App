import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/api_service_url.dart';
import '../model/trending_movie_model.dart';

class MovieRepository {
  static Future<List<Movie>> fetchTopRated() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/top_rated?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchPopularMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }
    https: //api.themoviedb.org/3/movie/popular?api_key=f9f4783f569fcd1104aaf0a401c35778

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchUpcomingMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/upcoming?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchNowPlayingMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/now_playing?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
