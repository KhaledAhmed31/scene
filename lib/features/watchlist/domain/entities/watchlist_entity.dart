
import 'package:scene/core/movies/entity/common_response_entity.dart';

class WatchlistEntity {
  final List<WatchlistItemEntity> movies;
  WatchlistEntity({required this.movies});

}
class WatchlistItemEntity extends CommonItemEntity{
  
  WatchlistItemEntity({required super.title,required super.backdropPath,required super.releaseDate,required super.id});

}