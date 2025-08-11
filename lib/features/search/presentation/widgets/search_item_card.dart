import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/routing/routing_paths.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';

class CommonMovieListItem extends StatelessWidget {
  const CommonMovieListItem({super.key, required this.searchEntity});
  final CommonItemEntity searchEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutingPaths.movieDetails, extra: searchEntity.id);
      },
      child: SizedBox(
        height: 90.h,
        child: Row(
          spacing: 10.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0.r),

              child:
                  (searchEntity.backdropPath != null)
                      ? CachedNetworkImage(
                        imageUrl:
                            ApiConstants.imageBaseUrl +
                            (searchEntity.backdropPath!),
                        fit: BoxFit.fill,
                        placeholder:
                            (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: AppColors.selectedIcon,
                              ),
                            ),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.broken_image_rounded,
                              color: Colors.white,
                            ),
                        height: 90.h,
                        width: 140.w,
                      )
                      : SizedBox(
                        height: 90.h,
                        width: 140.w,
                        child: Icon(
                          Icons.broken_image_rounded,
                          color: Colors.white,
                        ),
                      ),
            ),
            SizedBox(
              width: 230.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchEntity.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FontManager.getRegularInterStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    searchEntity.releaseDate ?? "",
                    style: FontManager.getRegularInterStyle(
                      fontSize: 13.sp,
                      color: AppColors.grayTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
