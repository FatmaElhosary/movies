import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/home_tab/views/widgets/poster_image.dart';

class UpcommingMovie extends StatelessWidget {
  const UpcommingMovie({super.key, required this.movie});
  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: PosterImage(
        movie: movie,
        width: MediaQuery.of(context).size.width / 3,
      ),
    );
  }
}
