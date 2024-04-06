import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/screens/movie_details.dart';
import 'package:movies/home_tab/views/widgets/recommend_movie.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  var moviesModel = MoviesProvider();
  @override
  void initState() {
    moviesModel.getRecommendedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => moviesModel,
      child: Consumer<MoviesProvider>(
        builder: (BuildContext context, recommendedMovies, Widget? child) {
          if (recommendedMovies.recommendedIsLoading) {
            return const Expanded(child: WatingWidget());
          } else if (recommendedMovies.recommendedrErrorMessage != null) {
            return Text(recommendedMovies.recommendedrErrorMessage ?? "");
          }
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movieId:
                            recommendedMovies.currentRecommended[index].id ?? 1,
                      ),
                    )),
                child: RecommendedMovie(
                  movie: recommendedMovies.currentRecommended[index],
                ),
              ),
              itemCount: recommendedMovies.currentRecommended.length,
            ),
          );
        },
      ),
    );
  }
}
