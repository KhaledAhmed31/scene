import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/popular/domain/entities/popular_movies_entity.dart';
import 'package:scene/features/home/popular/domain/repositories/popular_repo_interface.dart';

@lazySingleton
class GetPopularUseCase {
  final PopularRepoInterface _popularRepository;

  GetPopularUseCase(this._popularRepository);

  Future<(Failure?, PopularMoviesEntity?)> call() async =>
      await _popularRepository.getPopularMovies();
}
