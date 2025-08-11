import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/home/popular/data/datasources/popular_data_source.dart';
import 'package:scene/features/home/popular/data/mapper/popular_mapper.dart';
import 'package:scene/features/home/popular/domain/entities/popular_movies_entity.dart';
import 'package:scene/features/home/popular/domain/repositories/popular_repo_interface.dart';

@LazySingleton(as: PopularRepoInterface)
class PopularRepo implements PopularRepoInterface {
  final PopularDataSource _popularDataSource;
  PopularRepo(this._popularDataSource);
  @override
  Future<(Failure?, PopularMoviesEntity)> getPopularMovies() async {
    try {
      final response = await _popularDataSource.getPopularMovies();
      return (null, response.toEntity());
    } on AppException catch (e) {
      return (Failure(e.message), PopularMoviesEntity());
    }
  }
}
