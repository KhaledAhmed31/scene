import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/errors/remote/more_like_this_error_handler.dart';
import 'package:scene/core/errors/remote/new_releases_error_handler.dart';
import 'package:scene/core/errors/remote/recommended_error_handler.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/features/home/widgets/movies_sections/data/models/recommended_response_model.dart';

@lazySingleton
class SectionsDateSource {
  final Dio _dio;
  SectionsDateSource(this._dio);
  Future<SectionsResponseModel> fetchRecommendedMovies() async {
    try {
      final response = await _dio.get(ApiConstants.recommendedMoviesEndpoint);
      return SectionsResponseModel.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['status_message'] ?? 'An error occurred';
        throw RecommendedErrorHandler(message: message);
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<SectionsResponseModel> fetchNewMovies() async {
    try {
      final response = await _dio.get(ApiConstants.newMoviesEndpoint);
      return SectionsResponseModel.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['status_message'] ?? 'An error occurred';
        throw NewReleasesErrorHandler(message: message);
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<SectionsResponseModel> fetchMoreLikeThisMovies(String movieId) async {
    try {
      final response = await _dio.get(
        ApiConstants.moreLikeThisEndpoint(movieId),
      );
      return SectionsResponseModel.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['status_message'] ?? 'An error occurred';
        throw MoreLikeThisErrorHandler(message: message);
      }
      throw RemoteErrorHandler(message: message);
    }
  }
}
