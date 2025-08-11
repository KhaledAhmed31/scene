import 'genre.dart';

class GenresResponseModel {
  List<Genre>? genres;

  GenresResponseModel({this.genres});

  GenresResponseModel.fromJson(Map<String, dynamic> json) {
    genres=
    (json['genres'] as List<dynamic>?)
        ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
