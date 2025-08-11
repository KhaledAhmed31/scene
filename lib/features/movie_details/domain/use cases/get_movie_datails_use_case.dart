import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:scene/features/movie_details/domain/repository/movie_details_repo_interface.dart';

@lazySingleton
class GetMovieDatailsUseCase {
  final MovieDetailsRepoInterface _movieDetailsRepo;
  GetMovieDatailsUseCase(this._movieDetailsRepo);
  Future<(Failure?, MovieDetailsEntity?)> call(String movieId) async =>
      _movieDetailsRepo.getMovieDetails(movieId);
}
