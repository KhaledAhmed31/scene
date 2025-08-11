import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/home/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/movies_sections/domain/use%20cases/fetch_recommended_use_case.dart';
import 'package:scene/features/home/movies_sections/presentation/cubit/recommended/recommended_states.dart';

@lazySingleton
class RecommendedCubit extends Cubit<RecommendedState> {
  final FetchRecommendedUseCase _fetchRecommendedUseCase;
  List<SectionsEntity>? recommendedMovies;
  RecommendedCubit(this._fetchRecommendedUseCase)
    : super(RecommendedInitialState()) {
    fetchNewAndRecommendedMovies();
  }
  Future<void> fetchNewAndRecommendedMovies() async {
    emit(RecommendedLoadingState());
    final (failure, response) = await _fetchRecommendedUseCase();
    if (failure == null) {
      recommendedMovies = response?.movies;
      emit(RecommendedLoadedState());
    } else {
      emit(RecommendedErrorState(failure.message));
    }
  }
}
