import 'package:flutter/material.dart';
import 'package:movies/home_tab/data/models/movies_model.dart';
import 'package:movies/home_tab/models/movie_details/genre.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';

class CategoriesProvider with ChangeNotifier{
List<Genre> genres = [];
  bool genresIsLoading = false;
  String? genresErrorMessage;


 Future<void> getGenries()async{
 genresIsLoading = true;
    notifyListeners();
    try {
      MovieDetails genresRes =
          await MoviesApiManager.getGenres();
      if (genresRes.statusMessage == null) {
        genres = genresRes.genres ?? [];
      } else {
        genresErrorMessage = genresRes.statusMessage!;
      }
    } catch (e) {
      genresErrorMessage = e.toString();
    }

    genresIsLoading = false;
    notifyListeners();
}
}