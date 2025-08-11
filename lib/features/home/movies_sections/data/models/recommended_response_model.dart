class SectionsResponseModel {
  int? page;
  List<MovieCardModel>? movieCardModel;
  int? totalPages;
  int? totalResults;

  SectionsResponseModel({
    this.page,
    this.movieCardModel,
    this.totalPages,
    this.totalResults,
  });

  SectionsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      movieCardModel =
          json["results"] == null
              ? null
              : (json["results"] as List)
                  .map((e) => MovieCardModel.fromJson(e))
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

class MovieCardModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  MovieCardModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  MovieCardModel.fromJson(Map<String, dynamic> json) {
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
    if (json["origin_country"] is List) {
      originCountry =
          json["origin_country"] == null
              ? null
              : List<String>.from(json["origin_country"]);
    }
    if (json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if (json["original_name"] is String) {
      originalName = json["original_name"];
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
    if (json["first_air_date"] is String) {
      firstAirDate = json["first_air_date"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["title"] is String) {
      name = json["title"];
    }
    if (json["release_date"] is String) {
      firstAirDate = json["release_date"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }
}
