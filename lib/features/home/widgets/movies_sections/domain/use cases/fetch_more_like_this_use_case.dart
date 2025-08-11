import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/repository/recommended_repo_interface.dart';

@lazySingleton
class FetchMoreLikeThisUseCase {
  final SectionsRepoInterface _sectionsRepoInterface;
  FetchMoreLikeThisUseCase(this._sectionsRepoInterface);

  Future<(Failure?, SectionsResponseEntity?)> call(String movieId) async =>
      await _sectionsRepoInterface.fetchMoreLikeThisMovies(movieId);
}
