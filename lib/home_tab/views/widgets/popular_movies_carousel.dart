import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_tab/view_model/movies_provider.dart';
import 'package:movies/home_tab/views/screens/movie_details.dart';
import 'package:movies/home_tab/views/widgets/popular_movie.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class PopularCarouselSlider extends StatefulWidget {
  const PopularCarouselSlider({super.key});

  @override
  State<PopularCarouselSlider> createState() => _PopularCarouselSliderState();
}

class _PopularCarouselSliderState extends State<PopularCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    var popularProvider = Provider.of<MoviesProvider>(context);

    return CarouselSlider.builder(
      itemCount: popularProvider.currentPopular.length,
      itemBuilder: (context, int itemIndex, int pageViewIndex) {
        if (popularProvider.popularIsLoading) {
          return const WatingWidget();
        } else if (popularProvider.popularErrorMessage != null) {
          return Center(
            child: Text(
              popularProvider.popularErrorMessage ?? '',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(
                  movieId: popularProvider.currentPopular[itemIndex].id ?? 1,
                ),
              )),
          child: PopularMovie(
            result: popularProvider.currentPopular[itemIndex],
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3,
        // aspectRatio: 2 / 1,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
