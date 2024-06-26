import 'package:movies/home_tab/models/movie_details/movie_details.dart';

class PopularMoviesRes {
  // DateModel? dates;
  int? page;
  List<MovieDetails>? results;
  int? totalPages;
  int? totalResults;
  String? statusMessage;
  PopularMoviesRes({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.statusMessage,
  });

  PopularMoviesRes.fromJson(Map<String, dynamic> json) {
    // dates = json["dates"];
    page = json["page"];
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => MovieDetails.fromMap(e)).toList();
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
    statusMessage = json["status_message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    if (results != null) {
      data["results"] = results?.map((e) => e.toMap()).toList();
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

/* class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Result.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds =
        json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      data["genre_ids"] = genreIds;
    }
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
 */