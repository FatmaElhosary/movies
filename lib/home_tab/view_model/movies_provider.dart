import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/data/models/movies_model.dart';

class MoviesProvider with ChangeNotifier {
  List<MovieDetails> popularMovies = [];
  bool popularIsLoading = false;
  String? popularErrorMessage;
  ////////////////////
  List<MovieDetails> upcommingMovies = [];
  bool upcommingIsLoading = false;
  String? upcommingrErrorMessage;
  /////////////////
  List<MovieDetails> recommendedMovies = [];
  bool recommendedIsLoading = false;
  String? recommendedrErrorMessage;
  //////////////
  late MovieDetails movie;
  bool movieIsLoading = false;
  String? movieErrorMessage;
  ///////////////////
  List<MovieDetails> similarMovies = [];
  bool similarIsLoading = false;
  String? similarErrorMessage;
//////////////////
  get currentPopular => popularMovies;
  get currentUpcomming => upcommingMovies;
  get currentRecommended => recommendedMovies;

  Future<void> getPopularMovies() async {
    popularIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes popularMoviesRes =
          await MoviesApiManager.getPopularMovies();
      if (popularMoviesRes.statusMessage == null) {
        popularMovies = popularMoviesRes.results ?? [];
      } else {
        popularErrorMessage = popularMoviesRes.statusMessage!;
      }
    } catch (e) {
      popularErrorMessage = e.toString();
    }

    popularIsLoading = false;
    notifyListeners();
  }

  Future<void> getUpcommingMovies() async {
    upcommingIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes upcommingMoviesRes =
          await MoviesApiManager.getUpcommingMovies();
      if (upcommingMoviesRes.statusMessage == null) {
        upcommingMovies = upcommingMoviesRes.results ?? [];
      } else {
        upcommingrErrorMessage = upcommingMoviesRes.statusMessage!;
      }
    } catch (e) {
      upcommingrErrorMessage = e.toString();
    }

    upcommingIsLoading = false;
    notifyListeners();
  }

  Future<void> getRecommendedMovies() async {
    recommendedIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes recommendedMoviesRes =
          await MoviesApiManager.getUpcommingMovies();
      if (recommendedMoviesRes.statusMessage == null) {
        recommendedMovies = recommendedMoviesRes.results ?? [];
      } else {
        recommendedrErrorMessage = recommendedMoviesRes.statusMessage!;
      }
    } catch (e) {
      recommendedrErrorMessage = e.toString();
    }

    recommendedIsLoading = false;
    notifyListeners();
  }

  Future<void> getMovieDetailsBuId(int id) async {
    movieIsLoading = true;
    notifyListeners();
    try {
      MovieDetails movieDetailsRes = await MoviesApiManager.getMovieById(id);
      if (movieDetailsRes.statusMessage == null) {
        movie = movieDetailsRes;
      } else {
        movieErrorMessage = movieDetailsRes.statusMessage!;
      }
    } catch (e) {
      movieErrorMessage = e.toString();
    }

    movieIsLoading = false;
    notifyListeners();
  }

  Future<void> getSimilarMovies(int id) async {
    similarIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes similarMoviesRes =
          await MoviesApiManager.getSimilarMovies(id);
      if (similarMoviesRes.statusMessage == null) {
        similarMovies = similarMoviesRes.results ?? [];
      } else {
        similarErrorMessage = similarMoviesRes.statusMessage!;
      }
    } catch (e) {
      similarErrorMessage = e.toString();
    }

    similarIsLoading = false;
    notifyListeners();
  }
}
