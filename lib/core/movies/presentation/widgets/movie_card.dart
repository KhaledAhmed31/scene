import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/entity/movie_card_entity.dart';
import 'package:scene/core/routing/routing_paths.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movieCardType,
    this.sectionType,
    required this.movieCardEntity,
    required this.size,
  });
  final (double, double) size;
  final MovieCardType movieCardType;
  final SectionType? sectionType;
  final MovieEntity movieCardEntity;
  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isAddedToWishList = false;
  bool get isOrdinaryCard => widget.movieCardType == MovieCardType.ordinary;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutingPaths.movieDetails,
          extra: widget.movieCardEntity.id,
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Container(
              height: widget.size.$2,
              decoration: BoxDecoration(color: AppColors.cardColor),

              child: Column(
                children: [
                  SizedBox(
                    height: (isOrdinaryCard) ? 128.h : 199.h,
                    width: (isOrdinaryCard) ? 99.w : 129.w,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${widget.movieCardEntity.posterPath ?? ""}",
                      placeholder:
                          (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.selectedIcon,
                            ),
                          ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),

                  (widget.movieCardType == MovieCardType.popular)
                      ? SizedBox.shrink()
                      : (widget.sectionType != SectionType.newRelease)
                      ? SizedBox(
                        width: 97.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: 5.28.h, width: 85.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.starIcon,
                                    width: 10.w,
                                    height: 10.h,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    (widget.movieCardEntity.voteAverage ?? 0)
                                        .toStringAsPrecision(2),
                                    style: FontManager.getRegularPoppinsStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                widget.movieCardEntity.title ?? "Unknown Title",
                                overflow: TextOverflow.ellipsis,
                                style: FontManager.getRegularPoppinsStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.movieCardEntity.releaseDate ??
                                    "Unknown Date",
                                style: FontManager.getRegularInterStyle(
                                  fontSize: 8.sp,
                                  color: AppColors.grayTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAddedToWishList = !isAddedToWishList;
                });
              },
              child:
                  isAddedToWishList
                      ? SvgPicture.asset(
                        Assets.addedToWatchlistIcon,
                        width: 27.w,
                        height: 36.h,
                      )
                      : SvgPicture.asset(
                        Assets.addToWatchlistIcon,
                        width: 27.w,
                        height: 36.h,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
