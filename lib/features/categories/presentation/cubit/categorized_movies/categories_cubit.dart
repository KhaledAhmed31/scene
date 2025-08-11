import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/categories/data/repositories/categories_repo.dart';
import 'package:scene/features/categories/presentation/cubit/categorized_movies/categories_states.dart';

@lazySingleton


class CategoriesCubit extends Cubit<CategoriesStates> {
  final CategoriesRepo _categoriesRepo;
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitialState());

  void fetchCategories(String genreID) async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.fetchCategories(genreID);
    if (result.$1 == null) {
      emit(CategoriesLoadedState(result.$2!.results));
    } else {
      emit(CategoriesErrorState(result.$1!.message));
    }
  }
}
