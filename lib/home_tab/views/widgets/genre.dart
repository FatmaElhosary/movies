import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/movie_details/genre.dart';
import 'package:movies/shared/constants.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({super.key, required this.gen});
  final Genre? gen;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
          border: Border.all(color: Constants.darkgreyColor),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        gen?.name ?? '',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 10,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
