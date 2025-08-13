class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String apiKey =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZWMyYzc0MjgzN2UwNTJkY2Y2YmMxMTJkZTFmNWI1ZSIsIm5iZiI6MTc1MTc2NTMxNi40MTY5OTk4LCJzdWIiOiI2ODY5ZDE0NGFkYmYyM2ViYzlhOTUyMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.rk4uXDTu1oji-0hr-2LuUNlST4YKtCgunA0ujnw7yvk';
  static const String popularMoviesEndpoint = '3/movie/popular';
  static const String recommendedMoviesEndpoint = '3/movie/top_rated';
  static const String newMoviesEndpoint = '3/movie/upcoming';
  static const String movieDetailsEndpoint = '3/movie/';
  static String moreLikeThisEndpoint(String movieId) =>
      '3/movie/$movieId/similar';

  static const String searchEndpoint = '3/search/movie';
  static const String genresEndpoint = '3/genre/movie/list';
  static const String categoryEndpoint = '3/discover/movie';
}
