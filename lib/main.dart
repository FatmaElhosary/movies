import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/home_tab/views/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies/watched-tab/watch_tab_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
    create: (_) => WatchListProvider()..getMovies(),
    child: const MoviesApp(),
  ));
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
       
        HomeMovies.routeName: (_) => const HomeMovies(),
      },
      initialRoute: HomeMovies.routeName,
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
