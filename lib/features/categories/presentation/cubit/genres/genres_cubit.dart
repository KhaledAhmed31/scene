import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/categories/data/repositories/genres_repo.dart';
import 'package:scene/features/categories/presentation/cubit/genres/genres_state.dart';

@lazySingleton

class GenresCubit extends Cubit<GenresState> {
  final GenresRepo _genresRepo;

  GenresCubit(this._genresRepo) : super(GenresInitialState());

  void fetchGenres() async {
    emit(GenresLoadingState());
    final result = await _genresRepo.fetchGenres();
    if (result.$1 == null) {
      emit(GenresLoadedState(result.$2!.genres ?? []));
    } else {
      emit(GenresErrorState(result.$1!.message));
    }
  }
}
