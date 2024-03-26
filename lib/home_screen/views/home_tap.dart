import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_screen/view_model/popular_movies_provider.dart';
import 'package:movies/home_screen/views/popular_movie.dart';
import 'package:movies/shared_widgets/waiting_widget.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var popularProvider = Provider.of<PopularMoviesProvider>(context);
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: popularProvider.currentPopular.length,
          itemBuilder: (context, int itemIndex, int pageViewIndex) {
            if (popularProvider.isLoading) {
              return const WatingWidget();
            } else if (popularProvider.errorMessage != null) {
              return Center(
                child: Text(
                  popularProvider.errorMessage ?? '',
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
            // autoPlay: true,
            viewportFraction: 1,
          ),
        ),
        /*   Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: 200,
              color: Colors.blue[100],
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                ),
                SizedBox(height: 100, width: 100, child: Placeholder()),
              ],
            )
          ],
        ),
       */
      ],
    );
  }
}
     /*   CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            autoPlay: true,
          ),
          items: Provider.of<PopularMoviesProvider>(context)
              .popularMovies
              .map((movie) {
            return TopImage(
              result: movie,
            );
          }).toList(),
        )
       */