import 'package:scene/core/movies/entity/common_response_entity.dart';

class WatchlistEntity extends CommonResponseEntity{
  WatchlistEntity({required super.results});

}
class WatchlistItemEntity extends CommonItemEntity{
 WatchlistItemEntity({required super.id,required super.title,required super.releaseDate,required super.backdropPath}); 
  Map<String, dynamic> toJson() => {"id": id, "title": title, "release_date": releaseDate, "backdropPath": backdropPath};
 

}