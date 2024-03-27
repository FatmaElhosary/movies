import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/views/widgets/image_container.dart';

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
              child: ImageContainer(
                  imgUrl: movie.posterPath ?? '',
                  width: double.infinity,
                  height: 127),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'headlineLarge',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Deadpool 2',
                        style: theme.textTheme.headlineLarge),
                  ),
                  Text('2018  R  1h 59m',
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
