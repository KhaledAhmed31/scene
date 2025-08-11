class CommonResponseEntity {
  final List<CommonItemEntity> results;
  CommonResponseEntity({required this.results});
}

class CommonItemEntity {
  String? backdropPath;
  int? id;
  String? releaseDate;
  String? title;

  CommonItemEntity({this.backdropPath, this.id, this.releaseDate, this.title});
  Map<String, dynamic> toJson() => {"id": id, "title": title, "release_date": releaseDate, "backdropPath": backdropPath};
}
