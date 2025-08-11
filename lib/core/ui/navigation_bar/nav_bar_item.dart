import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scene/core/consts/colors/app_colors.dart';

class CustomNavBarItem extends BottomNavigationBarItem {
  CustomNavBarItem({required String iconPath, required super.label})
    : super(
        icon: SvgPicture.asset(
          iconPath,
          height: 20.sp,
          colorFilter: ColorFilter.mode(
            AppColors.unselectedIcon,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            AppColors.selectedIcon,
            BlendMode.srcIn,
          ),
        ),
      );
}
