// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:scene/core/services/injector_modul.dart' as _i299;
import 'package:scene/features/categories/data/datasources/categories_data_source.dart'
    as _i235;
import 'package:scene/features/categories/data/datasources/genres_data_source.dart'
    as _i426;
import 'package:scene/features/categories/data/repositories/categories_repo.dart'
    as _i497;
import 'package:scene/features/categories/data/repositories/genres_repo.dart'
    as _i80;
import 'package:scene/features/categories/presentation/cubit/categorized_movies/categories_cubit.dart'
    as _i200;
import 'package:scene/features/categories/presentation/cubit/genres/genres_cubit.dart'
    as _i508;
import 'package:scene/features/home/widgets/movies_sections/data/data%20source/sections_date_source.dart'
    as _i932;
import 'package:scene/features/home/widgets/movies_sections/data/repository/recommended_repo.dart'
    as _i246;
import 'package:scene/features/home/widgets/movies_sections/domain/repository/recommended_repo_interface.dart'
    as _i738;
import 'package:scene/features/home/widgets/movies_sections/domain/use%20cases/fetch_more_like_this_use_case.dart'
    as _i766;
import 'package:scene/features/home/widgets/movies_sections/domain/use%20cases/fetch_new_use_case.dart'
    as _i125;
import 'package:scene/features/home/widgets/movies_sections/domain/use%20cases/fetch_recommended_use_case.dart'
    as _i836;
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/more_like_this/more_like_this_cubit.dart'
    as _i112;
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/new_release/new_release_cubit.dart'
    as _i62;
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/recommended/recommended_cubit.dart'
    as _i713;
import 'package:scene/features/home/widgets/popular/data/datasources/popular_data_source.dart'
    as _i643;
import 'package:scene/features/home/widgets/popular/data/repositories/popular_repo.dart'
    as _i257;
import 'package:scene/features/home/widgets/popular/domain/repositories/popular_repo_interface.dart'
    as _i685;
import 'package:scene/features/home/widgets/popular/domain/usecases/get_popular_use_case.dart'
    as _i521;
import 'package:scene/features/home/widgets/popular/presentation/cubit/popular_cubit.dart'
    as _i989;
import 'package:scene/features/movie_details/data/data%20source/movie_details_data_source.dart'
    as _i198;
import 'package:scene/features/movie_details/data/repository/movie_details_repo.dart'
    as _i172;
import 'package:scene/features/movie_details/domain/repository/movie_details_repo_interface.dart'
    as _i423;
import 'package:scene/features/movie_details/domain/use%20cases/get_movie_datails_use_case.dart'
    as _i991;
import 'package:scene/features/movie_details/presentation/cubit/movie_details_cubit.dart'
    as _i29;
import 'package:scene/features/search/data/datasources/search_data_source.dart'
    as _i571;
import 'package:scene/features/search/data/repositories/search_repo.dart'
    as _i891;
import 'package:scene/features/search/presentation/cubit/search_cubit.dart'
    as _i502;
import 'package:scene/features/watchlist/data/datasources/watchlist_local_data_source.dart'
    as _i753;
import 'package:scene/features/watchlist/data/datasources/watchlist_remote_data_source.dart'
    as _i733;
import 'package:scene/features/watchlist/data/repositories/watchlist_repo.dart'
    as _i704;
import 'package:scene/features/watchlist/presentation/cubit/watchlist_cubit.dart'
    as _i725;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i753.WatchlistLocalDataSource>(
      () => _i753.WatchlistLocalDataSource(),
    );
    gh.lazySingleton<_i733.WatchlistDataSource>(
      () => _i733.WatchlistDataSource(),
    );
    gh.factory<_i235.CategoriesDataSource>(
      () => _i235.CategoriesDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i426.GenresDataSource>(
      () => _i426.GenresDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i198.MovieDetailsDataSource>(
      () => _i198.MovieDetailsDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i571.SearchDataSource>(
      () => _i571.SearchDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i932.SectionsDateSource>(
      () => _i932.SectionsDateSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i643.PopularDataSource>(
      () => _i643.PopularDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i704.WatchlistRepo>(
      () => _i704.WatchlistRepo(
        movieDetailsDataSource: gh<_i198.MovieDetailsDataSource>(),
        watchlistDataSource: gh<_i733.WatchlistDataSource>(),
      ),
    );
    gh.lazySingleton<_i685.PopularRepoInterface>(
      () => _i257.PopularRepo(gh<_i643.PopularDataSource>()),
    );
    gh.lazySingleton<_i891.SearchRepo>(
      () => _i891.SearchRepo(gh<_i571.SearchDataSource>()),
    );
    gh.lazySingleton<_i521.GetPopularUseCase>(
      () => _i521.GetPopularUseCase(gh<_i685.PopularRepoInterface>()),
    );
    gh.lazySingleton<_i497.CategoriesRepo>(
      () => _i497.CategoriesRepo(gh<_i235.CategoriesDataSource>()),
    );
    gh.lazySingleton<_i80.GenresRepo>(
      () => _i80.GenresRepo(gh<_i426.GenresDataSource>()),
    );
    gh.lazySingleton<_i200.CategoriesCubit>(
      () => _i200.CategoriesCubit(gh<_i497.CategoriesRepo>()),
    );
    gh.lazySingleton<_i738.SectionsRepoInterface>(
      () => _i246.NewAndRecommendedRepo(gh<_i932.SectionsDateSource>()),
    );
    gh.factory<_i725.WatchlistCubit>(
      () => _i725.WatchlistCubit(gh<_i704.WatchlistRepo>()),
    );
    gh.lazySingleton<_i423.MovieDetailsRepoInterface>(
      () => _i172.MovieDetailsRepo(gh<_i198.MovieDetailsDataSource>()),
    );
    gh.lazySingleton<_i766.FetchMoreLikeThisUseCase>(
      () => _i766.FetchMoreLikeThisUseCase(gh<_i738.SectionsRepoInterface>()),
    );
    gh.lazySingleton<_i836.FetchRecommendedUseCase>(
      () => _i836.FetchRecommendedUseCase(gh<_i738.SectionsRepoInterface>()),
    );
    gh.lazySingleton<_i125.FetchNewUseCase>(
      () => _i125.FetchNewUseCase(gh<_i738.SectionsRepoInterface>()),
    );
    gh.lazySingleton<_i989.PopularCubit>(
      () =>
          _i989.PopularCubit(getPopularUseCase: gh<_i521.GetPopularUseCase>()),
    );
    gh.lazySingleton<_i502.SearchCubit>(
      () => _i502.SearchCubit(gh<_i891.SearchRepo>()),
    );
    gh.lazySingleton<_i991.GetMovieDatailsUseCase>(
      () => _i991.GetMovieDatailsUseCase(gh<_i423.MovieDetailsRepoInterface>()),
    );
    gh.lazySingleton<_i508.GenresCubit>(
      () => _i508.GenresCubit(gh<_i80.GenresRepo>()),
    );
    gh.lazySingleton<_i62.NewReleaseCubit>(
      () => _i62.NewReleaseCubit(gh<_i125.FetchNewUseCase>()),
    );
    gh.lazySingleton<_i112.MoreLikeThisCubit>(
      () => _i112.MoreLikeThisCubit(gh<_i766.FetchMoreLikeThisUseCase>()),
    );
    gh.lazySingleton<_i713.RecommendedCubit>(
      () => _i713.RecommendedCubit(gh<_i836.FetchRecommendedUseCase>()),
    );
    gh.lazySingleton<_i29.MovieDetailsCubit>(
      () => _i29.MovieDetailsCubit(gh<_i991.GetMovieDatailsUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i299.RegisterModule {}
