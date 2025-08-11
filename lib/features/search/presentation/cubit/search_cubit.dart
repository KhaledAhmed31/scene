import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/search/data/repositories/search_repo.dart';
import 'package:scene/features/search/presentation/cubit/search_state.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitialState());

  Future<void> searchMovies(String query) async {
    emit(SearchLoadingState());
    log("search is loading");
    final result = await _searchRepo.searchMovies(query);
    if (result.$1 == null) {
      if (query.isEmpty) {
        emit(SearchEmptyState());
        return;
      }

      emit(SearchLoadedState(movies: result.$2!.results));
      log("search is loaded");
    } else {
      emit(SearchErrorState(result.$1!.message));
      log("search is error");
    }
  }
}
