import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/movie_details/domain/use%20cases/get_movie_datails_use_case.dart';
import 'package:scene/features/movie_details/presentation/cubit/movie_details_states.dart';

@LazySingleton()
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDatailsUseCase _getMovieDatailsUseCase;
  MovieDetailsCubit(this._getMovieDatailsUseCase)
    : super(MovieDetailsInitialState());

  Future<void> fetchMovieDetails(String movieId) async {
    emit(MovieDetailsLoadingState());
    final (failure, response) = await _getMovieDatailsUseCase(movieId);
    if (failure == null) {
      emit(MovieDetailsLoadedState(response!));
    } else {
      emit(MovieDetailsErrorState(failure.message));
    }
  }
}
