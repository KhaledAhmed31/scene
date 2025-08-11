import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/entity/movie_card_entity.dart';
import 'package:scene/core/movies/presentation/widgets/movie_card.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/more_like_this_section.dart';
import 'package:scene/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:scene/features/movie_details/presentation/cubit/movie_details_states.dart';
import 'package:scene/features/movie_details/presentation/widgets/genres_card.dart';
import 'package:scene/features/movie_details/presentation/widgets/movie_images_slider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final int movieId;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieDetailsCubit _movieDetailsCubit = getIt.get<MovieDetailsCubit>();
  @override
  void initState() {
    _movieDetailsCubit.fetchMovieDetails(widget.movieId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<MovieDetailsCubit>(),

      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        builder: (BuildContext context, state) {
          if (state is MovieDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.selectedIcon),
            );
          } else if (state is MovieDetailsLoadedState) {
            final movieDetails = state.movieDetails;
            return Scaffold(
              appBar: AppBar(
                title: FittedBox(
                  child: Text(state.movieDetails.title ?? 'Movie Details'),
                ),
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    MovieImagesSlider(
                      images: [
                        movieDetails.backdropPath ?? '',
                        movieDetails.posterPath ?? '',
                        movieDetails.belongsToCollection?.posterPath ?? '',
                        movieDetails.belongsToCollection?.backdropPath ?? '',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                        right: 22.0,
                        top: 13.0,
                        bottom: 19.0,
                      ),
                      child: Column(
                        spacing: 10.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieDetails.title ?? 'Unknown Title',
                            style: FontManager.getRegularInterStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            movieDetails.releaseDate ?? 'Unknown Overview',
                            style: FontManager.getRegularInterStyle(
                              fontSize: 10,
                              color: AppColors.grayTextColor,
                            ),
                          ),
                          Row(
                            spacing: 15.w,
                            children: [
                              MovieCard(
                                movieCardType: MovieCardType.popular,
                                movieCardEntity: MovieEntity(
                                  id: widget.movieId,
                                  posterPath: movieDetails.posterPath ?? '',
                                ),
                                size: (129.w, 199.h),
                              ),
                              SizedBox(
                                height: 200.h,
                                width: 213.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
      
                                  children: [
                                    SizedBox(height: 10.h),
                                    GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 3.h,
                                            crossAxisSpacing: 9.w,
                                            childAspectRatio: 1 / 6,
                                            mainAxisExtent: 30.h,
                                          ),
                                      itemBuilder: (context, index) {
                                        return GenresCard(
                                          title:
                                              (state
                                                      .movieDetails
                                                      .genres?[index]
                                                      .name ??
                                                  'Unknown Genre'),
                                        );
                                      },
                                      itemCount:
                                          (state.movieDetails.genres ?? [])
                                              .length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      movieDetails.tagline ??
                                          'No tagline Available',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontManager.getRegularInterStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.genresCardText,
                                      ),
                                    ),
                                    const Spacer(),
      
                                    Text(
                                      'Original Country: ${movieDetails.originCountry ?? 'N/A'}',
                                      style: FontManager.getRegularInterStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.genresCardText,
                                        height: 2.h,
                                      ),
                                    ),
                                    Text(
                                      'Original Language: ${movieDetails.originalLanguage} ',
                                      style: FontManager.getRegularInterStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.genresCardText,
                                        height: 2.h,
                                      ),
                                    ),
                                    Text(
                                      'Runtime: ${movieDetails.runtime} min',
                                      style: FontManager.getRegularInterStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.genresCardText,
                                        height: 2.h,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Rating: ${movieDetails.voteAverage?.toStringAsFixed(2) ?? 'N/A'}',
                                              style:
                                                  FontManager.getRegularInterStyle(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors
                                                            .genresCardText,
                                                    height: 2.h,
                                                  ),
                                            ),
                                            SizedBox(width: 5.w),
                                            SvgPicture.asset(
                                              Assets.starIcon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Votes: ${movieDetails.voteCount ?? 0}',
                                          style:
                                              FontManager.getRegularInterStyle(
                                                fontSize: 12.sp,
                                                color: AppColors.genresCardText,
                                                height: 2.h,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            movieDetails.overview ?? 'No Overview Available',
                            style: FontManager.getRegularInterStyle(
                              fontSize: 13.sp,
                              color: AppColors.genresCardText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MoreLikeThisSection(movieId: widget.movieId),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            );
          } else if (state is MovieDetailsErrorState) {
            return Center(
              child: Text(
                "${state.message}\nTRY AGAIN",
                textAlign: TextAlign.center,
                style: FontManager.getSemiBoldInterStyle(
                  fontSize: 15.sp,
                  color: AppColors.selectedIcon,
                ).copyWith(height: 2, decoration: TextDecoration.none),
              ),
            );
          }
          return SizedBox.shrink();
        },
        listener: (BuildContext context, state) {
          if (state is MovieDetailsErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}
