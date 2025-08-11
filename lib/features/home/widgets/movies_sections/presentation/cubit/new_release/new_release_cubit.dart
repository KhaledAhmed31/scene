import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/use%20cases/fetch_new_use_case.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/new_release/new_release_states.dart';

@lazySingleton
class NewReleaseCubit extends Cubit<NewReleaseState> {
  final FetchNewUseCase _fetchNewUseCase;
  List<SectionsEntity>? newMovies;
  NewReleaseCubit(this._fetchNewUseCase) : super(NewReleaseInitialState()) {
    fetchNewMovies();
  }

  Future<void> fetchNewMovies() async {
    emit(NewReleaseLoadingState());
    final (failure, response) = await _fetchNewUseCase();
    if (failure == null) {
      newMovies = response?.movies;
      emit(NewReleaseLoadedState());
    } else {
      emit(NewReleaseErrorState(failure.message));
    }
  }
}
