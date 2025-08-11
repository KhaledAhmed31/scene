import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';

abstract class WatchlistState {
  const WatchlistState();
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoadingState extends WatchlistState {}

class WatchlistLoadedState extends WatchlistState {
  final List<WatchlistItemEntity> watchlist;

  WatchlistLoadedState(this.watchlist);
}

class WatchlistErrorState extends WatchlistState {
  final String message;

  WatchlistErrorState(this.message);
}
