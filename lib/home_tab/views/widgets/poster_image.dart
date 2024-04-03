import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/shared/constants.dart';

class PosterImage extends StatelessWidget {
  const PosterImage(
      {super.key, required this.movie, required this.width, this.height});
  final MovieDetails movie;
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: '${Constants.baseImageUrl}${movie.posterPath}',
        imageBuilder: (context, imageProvider) => Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: InkWell(
              onTap: () {}, child: Image.asset('assets/images/bookmark.png')),
        ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: Constants.whiteColor,
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error,
            color: Constants.whiteColor,
          ),
        ),
      ),
    );
  }
}
/*  CachedNetworkImage(
      imageUrl: '${Constants.baseImageUrl}$imgUrl',
      width: width,
      height: 400,
      fit: BoxFit.fill,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Constants.whiteColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Constants.whiteColor,
      ),
    ); */
/*
       {
            "adult": false,
            "backdrop_path": "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
            "genre_ids": [
                28,
                12,
                16,
                35,
                10751
            ],
            "id": 1011985,
            "original_language": "en",
            "original_title": "Kung Fu Panda 4",
            "overview": "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
            "popularity": 4795.12,
            "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
            "release_date": "2024-03-02",
            "title": "Kung Fu Panda 4",
            "video": false,
            "vote_average": 7.005,
            "vote_count": 322
        },
        */
