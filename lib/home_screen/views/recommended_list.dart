import 'package:flutter/material.dart';
import 'package:movies/home_screen/view_model/movies_provider.dart';
import 'package:movies/home_screen/views/recommend_movie.dart';
import 'package:movies/shared_widgets/waiting_widget.dart';
import 'package:provider/provider.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (BuildContext context, recommendedMovies, Widget? child) {
        if (recommendedMovies.recommendedIsLoading) {
          return const WatingWidget();
        } else if (recommendedMovies.recommendedrErrorMessage != null) {
          return const Text('Error');
        }
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => RecommendedMovie(
              movie: recommendedMovies.recommendedMovies[index],
            ),
            itemCount: 5,
          ),
        );
      },
    );
  }
}
