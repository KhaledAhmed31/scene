import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/widgets/popular/domain/entities/popular_movies_entity.dart';

@factoryMethod
abstract class PopularRepoInterface {
  Future<(Failure?, PopularMoviesEntity)> getPopularMovies();
}
