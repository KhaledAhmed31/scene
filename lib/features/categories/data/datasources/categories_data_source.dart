import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/core/movies/model/common_response_model.dart';

@injectable
class CategoriesDataSource {
  final Dio _dio;

  CategoriesDataSource(this._dio);

  Future<CommonResponseModel> fetchCategories(String genreID)async{
    try{
      final response = await _dio.get(ApiConstants.categoryEndpoint,queryParameters: {'with_genres':genreID});
      return CommonResponseModel.fromJson(response.data);
    }
    catch(e){
      String message = e.toString();
      if(e is DioException){
        message = e.response?.data['status_message'] ?? 'An error occurred';
      }
      throw RemoteErrorHandler(message: message);
    }
  }
}