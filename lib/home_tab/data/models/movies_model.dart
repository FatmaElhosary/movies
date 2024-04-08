import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';

class MoviesApiManager {
  static Future<PopularMoviesRes> getPopularMovies() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }

  static Future<PopularMoviesRes> getUpcommingMovies() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }

  static Future<PopularMoviesRes> getRecommendedMovies() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }

  static Future<MovieDetails> getMovieById(int id) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id',
    );
    var res = await http.get(url, headers: Constants.headers);
    return MovieDetails.fromMap(jsonDecode(res.body));
  }

  static Future<PopularMoviesRes> getSimilarMovies(int movieId) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId/similar',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }

  static Future<PopularMoviesRes> getMoviesByName(String query) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=$query',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }

  static Future<MovieDetails> getGenres() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list',
    );
    var res = await http.get(url, headers: Constants.headers);
    return MovieDetails.fromMap(jsonDecode(res.body));
  }
}
