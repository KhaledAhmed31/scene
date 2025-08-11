import 'package:scene/core/movies/entity/movie_card_entity.dart';
import 'package:scene/features/home/popular/data/models/popular_response.dart';
import 'package:scene/features/home/popular/domain/entities/popular_movies_entity.dart';

extension PopularMapper on PopularMoviesResponse {
  PopularMoviesEntity toEntity() => PopularMoviesEntity(
    movies:
        movies
            ?.map(
              (movie) => MovieEntity(
                adult: movie.adult,
                id: movie.id,
                voteCount: movie.voteCount,
                backdropPath: movie.backdropPath,
                title: movie.title,
                originalLanguage: movie.originalLanguage,
                overview: movie.overview,
                posterPath: movie.posterPath,
                releaseDate: movie.releaseDate,
                voteAverage: movie.voteAverage,
              ),
            )
            .toList(),
  );
}
