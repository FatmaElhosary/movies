import 'package:flutter/material.dart';
import 'package:movies/search_tab/views/screens/search_screen.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/home_tab/views/home_tap.dart';
import 'package:movies/watched-tab/views/screens/watched_screen.dart';

class HomeMovies extends StatefulWidget {
  static const String routeName = '/';
  const HomeMovies({super.key});

  @override
  State<HomeMovies> createState() => _HomeMoviesState();
}

class _HomeMoviesState extends State<HomeMovies> {
  List<Widget> tabs = [
    const HomeTab(),
    const SearchMovies(),
    const SearchMovies(),
    const WatchedMovies(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      body: SafeArea(
        child: tabs[selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x70000000),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 15,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: Constants.yellowColor,
          unselectedItemColor: Constants.iconColor,
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
          selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
          iconSize: 32.0,
          backgroundColor: const Color(0xFF1A1A1A),
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Home icon.png')),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/search.png')),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/browseicon.png')),
                label: 'BROWSE'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/watched.png')),
                label: 'Watchlist'),
          ],
        ),
      ),

      //MultiProvider(child: HomeTab()),
    );
  }
}
