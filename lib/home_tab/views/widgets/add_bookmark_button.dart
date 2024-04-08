// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:movies/watched-tab/data/firebase_utils.dart';

// class add_bookmark_bottom extends StatefulWidget {

//   @override
//   State<add_bookmark_bottom> createState() => _add_bookmark_bottomState();
// }

// class _add_bookmark_bottomState extends State<add_bookmark_bottom> {
//   bool isBookedmark = false;


//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:()
//       {
//         widget.addWatchlist();
//         isBookedmark != isBookedmark;
//       },
//         child:isBookedmark? Image.asset('assets/images/bookmarked.png'):Image.asset('assets/images/bookmark.png'));
//   }
  
// }


//   void addToWatchlist(){
//   FirebaseUtils.addMovieToFirestore(
//     MovieDetails(
//       id: movie.id,
//       title: movie.title,
//       releaseDate:movie.releaseDate ,
//     ),
//   ).timeout(
//     const Duration(milliseconds: 500),
//     onTimeout:(){
//       print('success');
//     }
//   ).catchError((_){
//     print('error');
//   });
// }


// // void addToWatchlist(){
// //   FirebaseUtils.addMovieToFirestore(
// //     MovieDetails(
// //       title: ,
// //       releaseDate: ,
// //     ),
// //   );
// // }