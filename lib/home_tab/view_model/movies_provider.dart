import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/data/models/movies_model.dart';

class MoviesProvider with ChangeNotifier {
  List<Result> popularMovies = [];
  bool popularIsLoading = false;
  String? popularErrorMessage;
  List<Result> upcommingMovies = [];
  bool upcommingIsLoading = false;
  String? upcommingrErrorMessage;
  List<Result> recommendedMovies = [];
  bool recommendedIsLoading = false;
  String? recommendedrErrorMessage;
  get currentPopular => popularMovies;
  get currentUpcomming => upcommingMovies;
  MoviesProvider() {
    getPopularMovies();
    getUpcommingMovies();
    getRecommendedMovies();
  }
  Future<void> getPopularMovies() async {
    popularIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes popularMoviesRes = await MoviesModel.getPopularMovies();
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
          await MoviesModel.getUpcommingMovies();
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
          await MoviesModel.getUpcommingMovies();
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
}
