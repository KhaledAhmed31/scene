import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/repository/recommended_repo_interface.dart';

@lazySingleton
class FetchRecommendedUseCase {
  final SectionsRepoInterface _recommendedRepo;

  FetchRecommendedUseCase(this._recommendedRepo);

  Future<(Failure?, SectionsResponseEntity?)> call() async =>
      await _recommendedRepo.fetchRecommendedMovies();
}
