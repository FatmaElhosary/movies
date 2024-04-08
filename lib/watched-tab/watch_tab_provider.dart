import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/watched-tab/data/firebase_utils.dart';

class WatchListProvider with ChangeNotifier {
  List<MovieDetails> movies = [];

  Future<void> getMovies() async {
    movies = await FirebaseUtils.getAllMoviesFromFirestore();
    notifyListeners();
  }
}
