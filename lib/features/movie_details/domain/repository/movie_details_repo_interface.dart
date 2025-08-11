import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/movie_details/domain/entity/movie_details_entity.dart';

@factoryMethod
abstract class MovieDetailsRepoInterface {
  Future<(Failure?, MovieDetailsEntity?)> getMovieDetails(String movieId);
}
