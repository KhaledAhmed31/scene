import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/movie_details/data/data%20source/movie_details_data_source.dart';
import 'package:scene/features/watchlist/data/datasources/watchlist_remote_data_source.dart';
import 'package:scene/features/watchlist/data/mapper/watchlist_mapper.dart';
import 'package:scene/features/watchlist/data/models/watchlist_model.dart';
import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class WatchlistRepo {
  final WatchlistDataSource watchlistDataSource;
  final MovieDetailsDataSource movieDetailsDataSource;
  WatchlistRepo({
    required this.movieDetailsDataSource,
    required this.watchlistDataSource,
  });

  Future<(Failure?,WatchlistEntity?)> getWatchlist() async {
    try {
      final result = await watchlistDataSource.getWatchlist();
      log("watchlist repo getWatchlist ${getIt.get<SharedPreferences>().get("userId")}");
      return (null, result.toEntity());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?,WatchlistEntity?)> addToWatchlist(
    WatchlistItemModel movie,
  ) async {
    try {
      final result = await watchlistDataSource.addToWatchlist(movie);
      return (null,result.toEntity());
    } on AppException catch (e) {
      log(e.message);
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?,WatchlistEntity?)> removeFromWatchlist(
    WatchlistItemModel movie,
  ) async {
    try {
      final result = await watchlistDataSource.removeFromWatchlist(movie);
      return (null, result.toEntity());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}
