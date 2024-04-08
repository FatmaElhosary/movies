import 'package:flutter/material.dart';
import 'package:movies/home_tab/data/models/movies_model.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';

class SearchProvider with ChangeNotifier {
  List<MovieDetails> searchMovies = [];
  bool searchIsLoading = false;
  String? searchErrorMessage;

  Future<void> getSearchMovies(String query) async {
    searchIsLoading = true;
    notifyListeners();
    try {
      PopularMoviesRes searchMoviesRes =
          await MoviesApiManager.getMoviesByName(query);
      if (searchMoviesRes.statusMessage == null) {
        searchMovies = searchMoviesRes.results ?? [];
      } else {
        searchErrorMessage = searchMoviesRes.statusMessage!;
      }
    } catch (e) {
      searchErrorMessage = e.toString();
    }

    searchIsLoading = false;
    notifyListeners();
  }

  claerLastSearch() {
    searchMovies = [];
    notifyListeners();
  }
}
