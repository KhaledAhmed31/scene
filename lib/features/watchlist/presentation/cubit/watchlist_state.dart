abstract class WatchlistState {
  const WatchlistState();
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoadingState extends WatchlistState {}

class WatchlistLoadedState extends WatchlistState {}

class WatchlistErrorState extends WatchlistState {
  final String message;

  WatchlistErrorState(this.message);
}
