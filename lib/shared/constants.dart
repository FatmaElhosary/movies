import 'package:flutter/material.dart';

class Constants {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color darkgreyColor = Color(0xFF514F4F);
  static const Color lightgreyColor = Color(0xFFB5B4B4);
  static const Color yellowColor = Color(0xFFFFBB3B);
  static const Color blackColor = Color(0xFF121312);
  static const Color bgColor = Color(0xFF343534);
  static const Color shadowColor = Color(0xFF343534);
  static const Color iconColor = Color(0xFFC6C6C6);

////API????????////
  static const baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static String apiToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTk0NTdhNzBmNmVjMjAzYzc2Y2NkYWI1NjQ3YzI4OSIsInN1YiI6IjVlZDcxODNmOGRkYzM0MDAyMWRhNWNmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D5dhXfGkIbCRbekac6r8lyfmB94NH7wYj0gvLnN-8HE";
  static Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $apiToken",
      };
}
