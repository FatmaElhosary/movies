import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/home_tab/views/widgets/popular_movies_carousel.dart';
import 'package:movies/home_tab/views/widgets/recommended_list.dart';
import 'package:movies/home_tab/views/widgets/upcomming_list.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: PopularCarouselSlider(),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.only(top: 8, left: 12, bottom: 8),
            color: Constants.darkgreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Releases ',
                  style: theme.textTheme.titleMedium,
                ),
                const UpcomingList(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.only(top: 8, left: 12, bottom: 8),
            color: Constants.darkgreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recomended',
                  style: theme.textTheme.titleMedium,
                ),
                const RecommendedList(),
              ],
            ),
          ),
        ),
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
