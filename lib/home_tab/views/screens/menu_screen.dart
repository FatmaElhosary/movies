import 'package:flutter/material.dart';
import 'package:movies/browse_tab/views/screens/browse_screen.dart';
import 'package:movies/home_tab/views/screens/home_screen.dart';
import 'package:movies/search_tab/views/screens/search_screen.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/watched-tab/views/screens/watched_screen.dart';

class menuScreen extends StatefulWidget {
  static const String routeName = 'menu';
  const menuScreen({super.key});

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  List <Widget> tabs = [
    HomeMovies(),
    searchMovies(),
    browseMovies(),
    watchedMovies(),
  ];
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: Constants.bgColor
        ),
        child: SafeArea(
          child: Scaffold(
            body: tabs[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Constants.yellowColor,
        unselectedIconTheme: IconThemeData(color: Constants.lightgreyColor),
        unselectedLabelStyle: TextStyle(color: Constants.lightgreyColor),
        iconSize: 32.0,
        backgroundColor: Constants.darkgreyColor,
        onTap:(index){
          selectedIndex =index ;
          setState((){});
        },
         items:[
          BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Home icon.png')),
          label: 'HOME'),

          BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/search.png')),
          label: 'SEARCH'),

          BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/browseicon.png')),
          label:'BROWSE'),

          BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/watched.png')),
          label:'WATCHED'),
          ],),
          )),
        );
  }
}