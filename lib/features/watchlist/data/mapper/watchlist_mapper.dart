import 'package:scene/features/watchlist/data/models/watchlist_model.dart';
import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';

extension WatchlistMapper on WatchlistModel {
  WatchlistEntity toEntity() => WatchlistEntity(
        movies: (movies??[]).map((e) => WatchlistItemEntity(id: e.id, title: e.title, backdropPath: e.backdropPath, releaseDate: e.releaseDate)).toList(),
      );
}