import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';

class FirebaseUtils {
  static CollectionReference<MovieDetails> getMoviesCollection() =>
      FirebaseFirestore.instance
          .collection('movies')
          .withConverter<MovieDetails>(
            fromFirestore: (snapshot, _) =>
                MovieDetails.fromMap(snapshot.data()!),
            toFirestore: (moviesModel, _) => moviesModel.toMap(),
          );

  static Future<void> addMovieToFirestore(MovieDetails movie) {
    movie.isBookmarked = true;
    final tasksCollection = getMoviesCollection();
    final doc = tasksCollection.doc(movie.id.toString());
    return doc.set(movie);
  }

  static Future<List<MovieDetails>> getAllMoviesFromFirestore() async {
    final moviesCollection = getMoviesCollection();
    final querySnapshot = await moviesCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> deleteMovieFromFirestore(String movieId) {
    final moviesCollection = getMoviesCollection();
    return moviesCollection.doc(movieId).delete();
  }
}
