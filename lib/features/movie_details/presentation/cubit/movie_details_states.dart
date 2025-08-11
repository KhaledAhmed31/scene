import 'package:scene/features/movie_details/domain/entity/movie_details_entity.dart';

class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;
  MovieDetailsLoadedState(this.movieDetails);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;
  MovieDetailsErrorState(this.message);
}
