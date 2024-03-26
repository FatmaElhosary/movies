import 'package:flutter/material.dart';
import 'package:movies/home_screen/models/popular_movies_res.dart';
import 'package:movies/models/api_manager.dart';

class PopularMoviesProvider with ChangeNotifier {
  List<Result> popularMovies = [];
  bool isLoading = false;
  String? errorMessage;

  get currentPopular => popularMovies;
  PopularMoviesProvider() {
    getPopularMovies();
  }
  Future<void> getPopularMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes popularMoviesRes = await ApiManager.getPopularMovies();
      if (popularMoviesRes.statusMessage == null) {
        popularMovies = popularMoviesRes.results ?? [];
      } else {
        errorMessage = popularMoviesRes.statusMessage!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
