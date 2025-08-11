import 'package:scene/core/movies/model/common_response_model.dart';

class WatchlistItemModel extends CommonItemModel {
  WatchlistItemModel({
    required String title,
    required String backdropPath,
    required String releaseDate,
  }) : super(
         title: title,
         backdropPath: backdropPath,
         releaseDate: releaseDate,
       );

  WatchlistItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    backdropPath = json['poster_path'];
    releaseDate = json['release_date'];
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "backdropPath": backdropPath,
      "release_date": releaseDate,
    };
  }
}
