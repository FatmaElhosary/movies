import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/widgets/cover_image.dart';
import 'package:movies/home_tab/views/widgets/genre.dart';
import 'package:movies/home_tab/views/widgets/more_like_movie_list.dart';
import 'package:movies/home_tab/views/widgets/poster_image.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final moviesprovider = MoviesProvider();
  @override
  void initState() {
    moviesprovider.getMovieDetailsBuId(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => moviesprovider,
      child: Consumer<MoviesProvider>(
        builder: (BuildContext context, movie, Widget? child) {
          if (movie.movieIsLoading) {
            return const WatingWidget();
          } else if (movie.movieErrorMessage != null) {
            return Text(' error${movie.movieErrorMessage}');
          }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  movie.movie.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xFF1D1E1D),
                foregroundColor: Constants.whiteColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CoverImage(
                            imgUrl: movie.movie.backdropPath ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            movie.movie.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            movie.movie.releaseDate ?? '',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          PosterImage(
                            imgUrl: movie.movie.posterPath ?? '',
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 4,
                                              crossAxisSpacing: 9,
                                              childAspectRatio: 2 / 1),
                                      itemBuilder: (context, index) =>
                                          GenreWidget(
                                        gen: movie.movie.genres?[index],
                                      ),
                                      itemCount: movie.movie.genres?.length,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      movie.movie.overview ?? '',
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: 13,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/star.png',
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '${movie.movie.voteAverage}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    // margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.only(top: 8, left: 12, bottom: 8),
                    color: Constants.darkgreyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Like This',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        MoreLikeThisList(
                          movieId: widget.movieId,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
