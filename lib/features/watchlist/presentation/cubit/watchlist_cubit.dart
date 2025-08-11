import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';
import 'package:scene/features/watchlist/data/repositories/watchlist_repo.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_state.dart';

@injectable
class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo _watchlistRepo;
  WatchlistCubit(this._watchlistRepo) : super(WatchlistInitial()) {
    getWatchlist();
  }

  Future<void> getWatchlist() async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.getWatchlist();
    if (result.$1 != null) {
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      emit(WatchlistLoadedState(result.$2??[]));
    }
  }

  Future<void> addToWatchlist(CommonItemEntity movie) async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.addToWatchlist(movie);
    if (result.$1 != null) {
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      emit(WatchlistLoadedState(result.$2!));
    }
  }

  Future<void> removeFromWatchlist(CommonItemEntity movie) async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.removeFromWatchlist(movie);
    if (result.$1 != null) {
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      emit(WatchlistLoadedState(result.$2!));
    }
  }
}
