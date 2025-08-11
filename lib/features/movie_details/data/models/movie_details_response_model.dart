class MovieDetailsResponseModel {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsResponseModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["belongs_to_collection"] is Map) {
      belongsToCollection =
          json["belongs_to_collection"] == null
              ? null
              : BelongsToCollection.fromJson(json["belongs_to_collection"]);
    }
    if (json["budget"] is int) {
      budget = json["budget"];
    }
    if (json["genres"] is List) {
      genres =
          json["genres"] == null
              ? null
              : (json["genres"] as List)
                  .map((e) => Genres.fromJson(e))
                  .toList();
    }
    if (json["homepage"] is String) {
      homepage = json["homepage"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["imdb_id"] is String) {
      imdbId = json["imdb_id"];
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
    if (json["production_companies"] is List) {
      productionCompanies =
          json["production_companies"] == null
              ? null
              : (json["production_companies"] as List)
                  .map((e) => ProductionCompanies.fromJson(e))
                  .toList();
    }
    if (json["production_countries"] is List) {
      productionCountries =
          json["production_countries"] == null
              ? null
              : (json["production_countries"] as List)
                  .map((e) => ProductionCountries.fromJson(e))
                  .toList();
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["revenue"] is int) {
      revenue = json["revenue"];
    }
    if (json["runtime"] is int) {
      runtime = json["runtime"];
    }
    if (json["spoken_languages"] is List) {
      spokenLanguages =
          json["spoken_languages"] == null
              ? null
              : (json["spoken_languages"] as List)
                  .map((e) => SpokenLanguages.fromJson(e))
                  .toList();
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["tagline"] is String) {
      tagline = json["tagline"];
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

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    if (json["english_name"] is String) {
      englishName = json["english_name"];
    }
    if (json["iso_639_1"] is String) {
      iso6391 = json["iso_639_1"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    if (json["iso_3166_1"] is String) {
      iso31661 = json["iso_3166_1"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["logo_path"] is String) {
      logoPath = json["logo_path"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["origin_country"] is String) {
      originCountry = json["origin_country"];
    }
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
  }
}
