import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/routing/routing_paths.dart';
import 'package:scene/features/categories/data/models/genres_response_model/genre.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.imageUrl, required this.genre});
  final String imageUrl;
  final Genre genre;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutingPaths.categorisedMoviesList, extra: genre);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0.r),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              height: 90.h,
              width: 158.w,
            ),
          ),
          Text(
            genre.name ?? 'genre',
            style: FontManager.getSemiBoldPoppinsStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
