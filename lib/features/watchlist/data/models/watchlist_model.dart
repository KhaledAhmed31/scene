import 'package:scene/core/movies/model/common_response_model.dart';

class   WatchlistModel {
 List<WatchlistItemModel>? movies;
  WatchlistModel({
    required this.movies,
  }) ;
  WatchlistModel.fromJson(Map<String, dynamic> json) {
   movies = (json['movies']as List).map((e) => WatchlistItemModel.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() => {"movies": movies};
}
class WatchlistItemModel extends CommonItemModel {
  WatchlistItemModel({
    required String title,
    required String backdropPath,
    required String releaseDate,
    required int id,
  }) : super(
    id: id,
         title: title,
         backdropPath: backdropPath,
         releaseDate: releaseDate,
       );

  WatchlistItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    backdropPath = json['backdropPath'];
    releaseDate = json['release_date'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "backdropPath": backdropPath,
      "release_date": releaseDate,
      "id": id
    };
  }
}
