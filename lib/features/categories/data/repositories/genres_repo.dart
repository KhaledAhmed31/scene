import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/features/categories/data/datasources/genres_data_source.dart';
import 'package:scene/features/categories/data/models/genres_response_model/genres_response_model.dart';

@lazySingleton

class GenresRepo {
  final GenresDataSource _genresDataSource;
  GenresRepo(this._genresDataSource);
  Future<(Failure?,GenresResponseModel?)> fetchGenres() async {
    try{
      return await _genresDataSource.fetchGenres().then((response) => (null,response));
    }on AppException catch(e){
      return (Failure(e.message),null); 
    }
  }
}