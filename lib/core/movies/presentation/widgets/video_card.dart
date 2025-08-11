import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500$imageUrl",
          fit: BoxFit.cover,
          height: 217.h,
          width: double.infinity,
          placeholder:
              (context, url) => Center(
                child: CircularProgressIndicator(color: AppColors.selectedIcon),
              ),
          errorWidget:
              (context, url, error) => Icon(Icons.image_not_supported_outlined),
        ),
        Positioned(
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.playButtonIcon,
              width: 60.w,
              height: 60.h,
            ),
          ),
        ),
      ],
    );
  }
}
