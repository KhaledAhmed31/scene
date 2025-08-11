import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/features/categories/presentation/widgets/genres_list.dart';

class CategoryTap extends StatelessWidget {
  const CategoryTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 20.h),
      child: Column(
        spacing: 40.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category ',
            style: FontManager.getRegularInterStyle(
              fontSize: 22.sp,
              color: Colors.white,
            ),
          ),
          GenresList(),
        ],
      ),
    );
  }
}
