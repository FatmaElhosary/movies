import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/screens/movie_details.dart';
import 'package:movies/home_tab/views/widgets/upcomming_movie.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class UpcomingList extends StatelessWidget {
  const UpcomingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (BuildContext context, moviesProvider, Widget? child) {
        if (moviesProvider.upcommingIsLoading) {
          return const WatingWidget();
        } else if (moviesProvider.upcommingrErrorMessage != null) {
          return Text(moviesProvider.popularErrorMessage ?? '');
        }
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(
                      movieId: moviesProvider.currentUpcomming[index].id ?? 1,
                    ),
                  )),
              child: UpcommingMovie(
                movie: moviesProvider.currentUpcomming[index],
              ),
            ),
            itemCount: moviesProvider.currentUpcomming.length,
          ),
        );
      },
    );
  }
}
