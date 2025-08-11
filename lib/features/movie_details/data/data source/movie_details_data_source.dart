import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/errors/remote/details_error_handler.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/features/movie_details/data/models/movie_details_response_model.dart';

@lazySingleton
class MovieDetailsDataSource {
  final Dio _dio;
  MovieDetailsDataSource(this._dio);

  Future<MovieDetailsResponseModel> getMovieDetails(String movieId) async {
    try {
      final response = await _dio.get(
        ApiConstants.movieDetailsEndpoint + movieId,
      );
      return MovieDetailsResponseModel.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['status_message'] ?? 'An error occurred';
        throw DetailsErrorHandler(message);
      }
      throw RemoteErrorHandler(message: message);
    }
  }
}
