import 'package:scene/core/movies/entity/movie_card_entity.dart';

class SectionsResponseEntity {
  List<SectionsEntity>? movies;
  SectionsResponseEntity({this.movies});
}

class SectionsEntity extends MovieEntity {
  SectionsEntity({
    super.adult,
    super.backdropPath,
    super.id,
    super.originalLanguage,
    super.overview,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.voteAverage,
    super.voteCount,
  });
}
