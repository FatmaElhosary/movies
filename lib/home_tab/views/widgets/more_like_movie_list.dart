import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/screens/movie_details.dart';
import 'package:movies/home_tab/views/widgets/recommend_movie.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class MoreLikeThisList extends StatefulWidget {
  const MoreLikeThisList({super.key, required this.movieId});
  final int movieId;

  @override
  State<MoreLikeThisList> createState() => _MoreLikeThisListState();
}

class _MoreLikeThisListState extends State<MoreLikeThisList> {
  var moviesModel = MoviesProvider();
  @override
  void initState() {
    moviesModel.getSimilarMovies(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => moviesModel,
      child: Consumer<MoviesProvider>(
        builder: (BuildContext context, similarMovies, Widget? child) {
          if (similarMovies.similarIsLoading) {
            return const Expanded(child: WatingWidget());
          } else if (similarMovies.similarErrorMessage != null) {
            return const Text('Error');
          }
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movieId: similarMovies.similarMovies[index].id ?? 1,
                      ),
                    )),
                child: RecommendedMovie(
                  movie: similarMovies.similarMovies[index],
                ),
              ),
              itemCount: similarMovies.similarMovies.length,
            ),
          );
        },
      ),
    );
  }
}
