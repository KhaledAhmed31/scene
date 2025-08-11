import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/widgets/movies_sections/data/data%20source/sections_date_source.dart';
import 'package:scene/features/home/widgets/movies_sections/data/mapper/recommended_mapper.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/repository/recommended_repo_interface.dart';

@LazySingleton(as: SectionsRepoInterface)
class NewAndRecommendedRepo implements SectionsRepoInterface {
  final SectionsDateSource _newAndRecommendedDateSource;
  NewAndRecommendedRepo(this._newAndRecommendedDateSource);
  @override
  Future<(Failure?, SectionsResponseEntity?)> fetchRecommendedMovies() async {
    try {
      return await _newAndRecommendedDateSource.fetchRecommendedMovies().then(
        (response) => (null, response.toEntity()),
      );
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  @override
  Future<(Failure?, SectionsResponseEntity?)> fetchNewMovies() async {
    try {
      return await _newAndRecommendedDateSource.fetchNewMovies().then(
        (response) => (null, response.toEntity()),
      );
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  @override
  Future<(Failure?, SectionsResponseEntity?)> fetchMoreLikeThisMovies(
    String movieId,
  ) async {
    try {
      return await _newAndRecommendedDateSource
          .fetchMoreLikeThisMovies(movieId)
          .then((response) => (null, response.toEntity()));
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}
