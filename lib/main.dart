import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_tab/views/screens/menu_screen.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/home_tab/views/screens/home_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //scroll i n web
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Movies',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        menuScreen.routeName:(_) => const menuScreen(),
        HomeMovies.routeName: (_) => const HomeMovies(),
      },
      initialRoute: menuScreen.routeName,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
