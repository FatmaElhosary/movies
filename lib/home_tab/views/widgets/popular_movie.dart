import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/popular_movies_res.dart';
import 'package:movies/home_tab/views/widgets/cover_image.dart';
import 'package:movies/home_tab/views/widgets/image_container.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        CoverImage(
          imgUrl: '${result.backdropPath}',
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ImageContainer(
                    imgUrl: result.backdropPath ?? '',
                    width: MediaQuery.of(context).size.width / 2.5 - 20,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            result.title ?? '',
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                        Text(
                          '${result.releaseDate}  PG-13  2h 7m',
                          style: theme.textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    /*     Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
        '${Constants.baseImageUrl}${result.backdropPath}',
      ))),
      child: Image.network(
        '${Constants.baseImageUrl}${result.posterPath}',
      ),

      /*   const Text(
          'Dora and the lost city of gold',
          style: TextStyle(color: Colors.red),
        ), */
    ); */
  }
}
  /*   Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Image.network(
                      '${Constants.baseImageUrl}${result.posterPath}',
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dora and the lost city of gold',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        '2019  PG-13  2h 7m',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
       */
        /*  Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${Constants.baseImageUrl}${result.backdropPath}',
                  )),
                  
                  ),
          child: Image.asset(
            'assets/images/play_button.png',
          ),
        ),
         */
        