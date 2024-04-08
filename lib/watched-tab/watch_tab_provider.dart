// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/watched-tab/data/firebase_utils.dart';

class WatchListProvider with ChangeNotifier {
  List<MovieDetails> movies = [];

  WatchListProvider() {
    // getMovies();
  }

  Future<void> getMovies() async {
    movies = await FirebaseUtils.getAllMoviesFromFirestore();
    notifyListeners();
  }

  Future<void> addMovie(MovieDetails movie) async {
    await FirebaseUtils.addMovieToFirestore(movie);
    movie.isBookmarked = true;
    movies.add(movie);
    notifyListeners();
  }

  Future<void> deleteMovie(MovieDetails movie) async {
    await FirebaseUtils.deleteMovieFromFirestore(movie.id.toString());
    movies.remove(movie);
    notifyListeners();
  }
/* 
    void isBookmarked(MovieDetails movie) {
    movies[movies.indexOf(movie)].isBookmarked = true;
    notifyListeners();
  }  */
}
