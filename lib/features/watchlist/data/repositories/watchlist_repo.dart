import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/app_exception.dart';
import 'package:scene/core/errors/failure/failure.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';
import 'package:scene/features/movie_details/data/data%20source/movie_details_data_source.dart';
import 'package:scene/features/watchlist/data/datasources/watchlist_remote_data_source.dart';
import 'package:scene/features/watchlist/data/mapper/watchlist_mapper.dart';
import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';

@lazySingleton
class WatchlistRepo {
  final WatchlistDataSource watchlistDataSource;
  final MovieDetailsDataSource movieDetailsDataSource;
  WatchlistRepo({
    required this.movieDetailsDataSource,
    required this.watchlistDataSource,
  });

  Future<(Failure?, List<WatchlistItemEntity>?)> getWatchlist() async {
    try {
      final result = await watchlistDataSource.getWatchlist();
      return (null, result.map((e) => e.toEntity()).toList(),);
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?, List<WatchlistItemEntity>?)> addToWatchlist(
    CommonItemEntity movie,
  ) async {
    try {
      final result = await watchlistDataSource.addToWatchlist(movie);
      return (null,result.map((e) => e.toEntity()).toList() );
    } on AppException catch (e) {
      throw Failure(e.message);
    }
  }

  Future<(Failure?, List<WatchlistItemEntity>?)> removeFromWatchlist(
    CommonItemEntity movie,
  ) async {
    try {
      final result = await watchlistDataSource.removeFromWatchlist(movie);
      return (null, result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}
