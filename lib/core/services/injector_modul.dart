import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {"Authorization": ApiConstants.apiKey},
    ),
  );
  @preResolve
  Future<SharedPreferences> get sharedPreferences async{
    return await SharedPreferences.getInstance();
  }
}
