import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/features/search/presentation/cubit/search_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _controller;
  late FocusNode focusNode;
  @override
  void initState() {
    _controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 343.w,
      child: TextField(
        autofocus: false,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        onTapOutside: (event) {
          focusNode.unfocus();
          setState(() {});
        },
        onSubmitted: (value) {
          focusNode.unfocus();
          setState(() {});
        },
        onTap: () {
          setState(() {});
        },

        onChanged: (value) async {
          BlocProvider.of<SearchCubit>(context).searchMovies(value);

          setState(() {});
        },
        controller: _controller,
        cursorColor: AppColors.selectedIcon,
        style: FontManager.getRegularInterStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
        keyboardAppearance: Brightness.dark,
        textInputAction: TextInputAction.search,
        selectionWidthStyle: BoxWidthStyle.max,
        decoration: InputDecoration(
          suffixIcon:
              (_controller.text.isNotEmpty && focusNode.hasFocus)
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.clear();
                        BlocProvider.of<SearchCubit>(context).searchMovies("");
                      });
                    },
                    child: Icon((Icons.clear), color: Colors.white),
                  )
                  : null,

          prefixIcon: SvgPicture.asset(
            Assets.searchIcon,
            fit: BoxFit.scaleDown,
          ),
          filled: true,
          fillColor: AppColors.cardColor,

          hint: Text(
            'Search',
            style: FontManager.getRegularInterStyle(
              fontSize: 14.sp,
              color: AppColors.grayTextColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0.r),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0.r),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0.w,
            ),
          ),
        ),
      ),
    );
  }
}
