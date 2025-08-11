import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/movie_details/data/data%20source/movie_details_data_source.dart';
import 'package:scene/features/movie_details/data/mapper/movie_details_mapper.dart';
import 'package:scene/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:scene/features/movie_details/domain/repository/movie_details_repo_interface.dart';

@LazySingleton(as: MovieDetailsRepoInterface)
class MovieDetailsRepo implements MovieDetailsRepoInterface {
  final MovieDetailsDataSource _movieDetailsDataSource;
  MovieDetailsRepo(this._movieDetailsDataSource);
  @override
  Future<(Failure?, MovieDetailsEntity?)> getMovieDetails(
    String movieId,
  ) async {
    try {
      return await _movieDetailsDataSource
          .getMovieDetails(movieId)
          .then((response) => (null, response.toEntity()));
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}
