import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/constants.dart';
import 'package:movies/home_screen/models/popular_movies_res.dart';

class ApiManager {
  static Future<PopularMoviesRes> getPopularMovies() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular',
    );
    var res = await http.get(url, headers: Constants.headers);
    return PopularMoviesRes.fromJson(jsonDecode(res.body));
  }
}
