import 'package:scene/features/categories/data/models/genres_response_model/genre.dart';

abstract class GenresState {
  const GenresState();
}

class GenresInitialState extends GenresState {}

class GenresLoadingState extends GenresState {}

class GenresErrorState extends GenresState {
  final String message;
  GenresErrorState(this.message);
}

class GenresLoadedState extends GenresState {
  final List<Genre> genres;
  GenresLoadedState(this.genres);
}
