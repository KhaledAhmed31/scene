import 'package:scene/features/watchlist/data/models/watchlist_model.dart';
import 'package:scene/features/watchlist/domain/entities/watchlist_entity.dart';

extension WatchlistMapper on WatchlistItemModel {
  WatchlistItemEntity toEntity() => WatchlistItemEntity(
        title: title,
        backdropPath: backdropPath,
        releaseDate: releaseDate,
        id: id
      );
}