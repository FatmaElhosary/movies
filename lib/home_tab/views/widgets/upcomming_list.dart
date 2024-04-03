import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/screens/movie_details.dart';
import 'package:movies/home_tab/views/widgets/upcomming_movie.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class UpcomingList extends StatefulWidget {
  const UpcomingList({super.key});

  @override
  State<UpcomingList> createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  var moviesModel = MoviesProvider();
  @override
  void initState() {
    moviesModel.getUpcommingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => moviesModel,
      child: Consumer<MoviesProvider>(
        builder: (BuildContext context, moviesProvider, Widget? child) {
          if (moviesProvider.upcommingIsLoading) {
            return const WatingWidget();
          } else if (moviesProvider.upcommingrErrorMessage != null) {
            return Text(moviesProvider.popularErrorMessage ?? '');
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
      ),
    );
  }
}
