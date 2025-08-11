import 'package:scene/core/movies/entity/common_response_entity.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  List<CommonItemEntity> movies;
  SearchLoadedState({required this.movies});
}

class SearchErrorState extends SearchState {
  String message;
  SearchErrorState(this.message);
}

class SearchEmptyState extends SearchState {}
