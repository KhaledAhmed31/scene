import 'package:scene/features/home/widgets/movies_sections/data/models/recommended_response_model.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';

extension NewAndRecommendedMapper on SectionsResponseModel {
  SectionsResponseEntity toEntity() => SectionsResponseEntity(
    movies:
        (movieCardModel ?? [])
            .map(
              (movie) => SectionsEntity(
                adult: movie.adult,
                backdropPath: movie.backdropPath,
                id: movie.id,
                originalLanguage: movie.originalLanguage,
                overview: movie.overview,
                posterPath: movie.posterPath,
                releaseDate: movie.firstAirDate,
                title: movie.name,
                voteAverage: movie.voteAverage,
                voteCount: movie.voteCount,
              ),
            )
            .toList(),
  );
}
