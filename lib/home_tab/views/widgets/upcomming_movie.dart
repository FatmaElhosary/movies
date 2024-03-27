import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/views/widgets/image_container.dart';

class UpcommingMovie extends StatelessWidget {
  const UpcommingMovie({super.key,required this.movie});
 final Result movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8),
      child: ImageContainer(
        imgUrl: movie.posterPath??"",
        width: MediaQuery.of(context).size.width / 3,
        height: 127,
      ),
    );
  }
}
