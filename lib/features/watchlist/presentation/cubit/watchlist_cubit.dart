import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/watchlist/data/models/watchlist_model.dart';
import 'package:scene/features/watchlist/data/repositories/watchlist_repo.dart';
import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_state.dart';

@injectable
class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo _watchlistRepo;
  WatchlistEntity? watchlist;

  WatchlistCubit(this._watchlistRepo) : super(WatchlistInitial());

  Future<void> getWatchlist() async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.getWatchlist();
    if (result.$1 != null) {
      log('error in cubit while get data');
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      watchlist = result.$2!;
      emit(WatchlistLoadedState());
    }
  }

  Future<void> addToWatchlist(WatchlistItemModel movie) async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.addToWatchlist(movie);
    if (result.$1 != null) {
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      watchlist = result.$2!;
      emit(WatchlistLoadedState());
    }
  }

  Future<void> removeFromWatchlist(WatchlistItemModel movie) async {
    emit(WatchlistLoadingState());
    final result = await _watchlistRepo.removeFromWatchlist(movie);
    if (result.$1 != null) {
      emit(WatchlistErrorState(result.$1!.message));
    } else {
      watchlist = result.$2!;
      emit(WatchlistLoadedState());
    }
  }
}
