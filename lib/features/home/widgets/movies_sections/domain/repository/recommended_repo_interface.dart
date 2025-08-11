import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';

@factoryMethod
abstract class SectionsRepoInterface {
  Future<(Failure?, SectionsResponseEntity?)> fetchRecommendedMovies();
  Future<(Failure?, SectionsResponseEntity?)> fetchNewMovies();
  Future<(Failure?, SectionsResponseEntity?)> fetchMoreLikeThisMovies(
    String movieId,
  );
}
