import 'package:flutter/material.dart';
import 'package:movies/browse_tab/view_model/categories_provider.dart';
import 'package:movies/browse_tab/views/screens/category_item.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:provider/provider.dart';

class BrowseMovies extends StatefulWidget {
  const BrowseMovies({super.key});

  @override
  State<BrowseMovies> createState() => _BrowseMoviesState();
}

class _BrowseMoviesState extends State<BrowseMovies> {
  var viewModel = CategoriesProvider();
  @override
  void initState() {
    viewModel.getGenries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Browse Category',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<CategoriesProvider>(
                builder: (BuildContext context, CategoriesProvider genry,
                    Widget? child) {
                  if (genry.genresIsLoading) {
                    return const WatingWidget();
                  } else if (genry.genresErrorMessage != null) {
                    return Text(genry.genresErrorMessage!);
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 1,
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) =>
                        CategoryItem(genre: genry.genres[index]),
                    itemCount: genry.genres.length,
                  );
                },
              ),
            ))
          ])),
    );
  }
}
