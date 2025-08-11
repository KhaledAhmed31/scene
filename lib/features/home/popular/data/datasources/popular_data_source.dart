import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/errors/remote/popular_error_handler.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/features/home/popular/data/models/popular_response.dart';

@lazySingleton
class PopularDataSource {
  final Dio _dio;
  PopularDataSource(this._dio);

  Future<PopularMoviesResponse> getPopularMovies() async {
    try {
      Response response = await _dio.get(ApiConstants.popularMoviesEndpoint);
      log("try getPopularMovies");
      return PopularMoviesResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['status_message'] ?? 'An error occurred';
        throw PopularErrorHandler(message: message);
      } else {
        throw RemoteErrorHandler(message: message);
      }
    }
  }
}
