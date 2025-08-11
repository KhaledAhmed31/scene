import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/entity/movie_card_entity.dart';
import 'package:scene/core/movies/presentation/widgets/movie_card.dart';
import 'package:scene/core/movies/presentation/widgets/video_card.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: 289.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoCard(imageUrl: widget.movieEntity.backdropPath ?? ""),
              SizedBox(
                height: 72.h,
                child: Row(
                  children: [
                    SizedBox(width: 164.w),
                    SizedBox(
                      width: screenWidth - 164.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Expanded(
                            child: Text(
                              widget.movieEntity.title ?? "Unknown Title",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: FontManager.getRegularInterStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            widget.movieEntity.releaseDate ??
                                "Unknown Release Date",
                            style: FontManager.getRegularInterStyle(
                              fontSize: 10.sp,
                              color: AppColors.grayTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 21.w,
          bottom: 0,
          child: MovieCard(
            size: (129.w, 199.h),
            movieCardEntity: widget.movieEntity,
            movieCardType: MovieCardType.popular,
          ),
        ),
      ],
    );
  }
}
