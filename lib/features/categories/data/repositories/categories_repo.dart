import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';
import 'package:scene/core/movies/model/common_response_model.dart';
import 'package:scene/features/categories/data/datasources/categories_data_source.dart';
import 'package:scene/features/search/data/mapper/search_mapper.dart';

@lazySingleton

class CategoriesRepo {
  final CategoriesDataSource _categoriesDataSource;

  CategoriesRepo(this._categoriesDataSource);

  Future <(Failure?,CommonResponseEntity?)> fetchCategories(String genreID)async{
    try{
    CommonResponseModel response = await _categoriesDataSource.fetchCategories(genreID);
    return (null,response.toEntity());
    }
    on AppException catch(e){
      return (Failure(e.message),null); 
    }
  }
}