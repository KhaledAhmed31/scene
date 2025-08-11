import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/presentation/widgets/movie_card.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';

class SectionsWidget extends StatelessWidget {
  const SectionsWidget({
    super.key,
    required this.movies,
    required this.sectionType,
    required this.sectionTitle,
  });
  final String sectionTitle;
  final List<SectionsEntity> movies;
  final SectionType sectionType;
  @override
  Widget build(BuildContext context) {
    bool isRxtraHeight = sectionType != SectionType.newRelease;

    return Container(
      height: (isRxtraHeight) ? 236.h : 187.h,

      decoration: BoxDecoration(color: AppColors.gray),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0.h, left: 20.w),
            child: Text(
              sectionTitle,
              style: FontManager.getRegularInterStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              addAutomaticKeepAlives: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (context, index) => SizedBox(width: 14.w),
              itemBuilder:
                  (context, index) => MovieCard(
                    size:
                        (sectionType == SectionType.newRelease)
                            ? (97.w, 128.h)
                            : (97.w, 180.h),
                    movieCardType: MovieCardType.ordinary,
                    sectionType: sectionType,
                    movieCardEntity: movies[index],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
