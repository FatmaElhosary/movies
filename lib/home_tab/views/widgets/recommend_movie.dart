import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/views/widgets/poster_image.dart';

class RecommendedMovie extends StatelessWidget {
  const RecommendedMovie({super.key, required this.movie});
  final Result movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(right: 12, top: 8),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 10, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            /*  offset: Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ), */
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 3,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: Constants.darkgreyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PosterImage(
                  imgUrl: movie.posterPath ?? '',
                  width: double.infinity,
                  height: 127),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/star.png',
                        height: 10,
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '${movie.voteAverage}',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(movie.originalTitle ?? '',
                        style: theme.textTheme.headlineLarge),
                  ),
                  Text('${movie.releaseDate}',
                      style:
                          theme.textTheme.headlineSmall!.copyWith(fontSize: 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
