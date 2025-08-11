class CommonResponseModel {
  int? page;
  List<CommonItemModel>? results;
  int? totalPages;
  int? totalResults;

  CommonResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results =
          json["results"] == null
              ? null
              : (json["results"] as List)
                  .map((e) => CommonItemModel.fromJson(e))
                  .toList();
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
  }
}

class CommonItemModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  CommonItemModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  CommonItemModel.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["genre_ids"] is List) {
      genreIds =
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["video"] is bool) {
      video = json["video"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }
}
