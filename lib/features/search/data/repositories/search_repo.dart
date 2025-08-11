import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/search/data/datasources/search_data_source.dart';
import 'package:scene/features/search/data/mapper/search_mapper.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';

@lazySingleton
class SearchRepo {
  final SearchDataSource _searchDataSource;

  SearchRepo(this._searchDataSource);

  Future<(Failure?, CommonResponseEntity?)> searchMovies(String query) async {
    try {
      return await _searchDataSource
          .searchMovies(query)
          .then((response) => (null, response.toEntity()));
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}
