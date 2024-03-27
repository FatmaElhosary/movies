import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_screen/view_model/movies_provider.dart';
import 'package:movies/home_screen/views/popular_movie.dart';
import 'package:movies/shared_widgets/waiting_widget.dart';
import 'package:provider/provider.dart';

class PopularCarouselSlider extends StatelessWidget {
  const PopularCarouselSlider({super.key});

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
        return PopularMovie(
          result: popularProvider.currentPopular[itemIndex],
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .4,
        //aspectRatio: 2.0,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
