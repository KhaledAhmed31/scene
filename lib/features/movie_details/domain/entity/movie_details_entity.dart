import 'package:scene/features/movie_details/data/models/movie_details_response_model.dart';

class MovieDetailsEntity {
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  List<Genres>? genres;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? title;
  double? voteAverage;
  int? voteCount;
  String? tagline;

  MovieDetailsEntity({
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
    required this.backdropPath,
    required this.genres,
    required this.belongsToCollection,
    required this.originCountry,
    required this.originalLanguage,
    required this.runtime,
    required this.tagline,
  });
}
