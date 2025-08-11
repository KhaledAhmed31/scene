import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';

class GenresCard extends StatelessWidget {
  const GenresCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0.r),
        border: Border.all(color: AppColors.genresCardStroke),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: FontManager.getRegularInterStyle(
            fontSize: 10,
            color: AppColors.genresCardText,
          ),
        ),
      ),
    );
  }
}
