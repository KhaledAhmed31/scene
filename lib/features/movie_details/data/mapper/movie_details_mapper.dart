import 'package:scene/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:scene/features/movie_details/domain/entity/movie_details_entity.dart';

extension MovieDetailsMapper on MovieDetailsResponseModel {
  MovieDetailsEntity toEntity() => MovieDetailsEntity(
    backdropPath: backdropPath,
    originalTitle: originalTitle,
    originCountry: originCountry,
    originalLanguage: originalLanguage,
    belongsToCollection: belongsToCollection,
    runtime: runtime,
    tagline: tagline,
    genres: genres,
    overview: overview,
    posterPath: posterPath,
    releaseDate: releaseDate,
    title: title,
    voteAverage: voteAverage,
    voteCount: voteCount,
  );
}
