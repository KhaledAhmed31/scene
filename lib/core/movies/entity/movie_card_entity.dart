class MoviesResponseEntity {
  List<MovieEntity>? movies;
  MoviesResponseEntity({this.movies});
}

class MovieEntity {
  bool? adult;
  int? id;
  String? backdropPath;
  String? originalLanguage;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  int? voteCount;
  MovieEntity({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });
}
