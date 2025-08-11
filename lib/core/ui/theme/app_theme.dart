import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBar,
        centerTitle: true,

        titleTextStyle: FontManager.getRegularInterStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.background,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.selectedIcon,
        selectionColor: const Color.fromARGB(255, 113, 103, 81),
        selectionHandleColor: AppColors.selectedIcon,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.selectedIcon,
        unselectedItemColor: AppColors.unselectedIcon,
        backgroundColor: AppColors.navBarBackground,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
