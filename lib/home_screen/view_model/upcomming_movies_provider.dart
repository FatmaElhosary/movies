import 'package:flutter/material.dart';
import 'package:movies/home_screen/models/popular_movies_res.dart';
import 'package:movies/api_models/api_manager.dart';

class UpcommingMoviesProvider with ChangeNotifier {
  List<Result> upcommingMovies = [];
  bool isLoading = false;
  String? errorMessage;

  get currentPopular => upcommingMovies;
  UpcommingMoviesProvider() {
    getUpcommingMovies();
  }
  Future<void> getUpcommingMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes upcommingMoviesRes = await ApiManager.getUpcommingMovies();
      if (upcommingMoviesRes.statusMessage == null) {
        upcommingMovies = upcommingMoviesRes.results ?? [];
      } else {
        errorMessage = upcommingMoviesRes.statusMessage!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
