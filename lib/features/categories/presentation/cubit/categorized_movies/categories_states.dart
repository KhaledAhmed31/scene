import 'package:scene/core/movies/entity/common_response_entity.dart';

class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesLoadedState extends CategoriesStates {
  final List<CommonItemEntity> movies;
  CategoriesLoadedState(this.movies);
}

class CategoriesErrorState extends CategoriesStates {
  final String message;
  CategoriesErrorState(this.message);
}