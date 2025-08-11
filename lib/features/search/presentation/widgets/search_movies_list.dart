import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/features/search/presentation/cubit/search_cubit.dart';

import 'package:scene/features/search/presentation/cubit/search_state.dart';
import 'package:scene/features/search/presentation/widgets/search_item_card.dart';

class SearchMoviesList extends StatefulWidget {
  const SearchMoviesList({super.key});

  @override
  State<SearchMoviesList> createState() => _SearchMoviesListState();
}

class _SearchMoviesListState extends State<SearchMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return Expanded(
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.selectedIcon),
            ),
          );
        } else if (state is SearchLoadedState) {
          if (state.movies.isEmpty) {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.nomoviesIcon),
                    Text(
                      "No result found",
                      style: FontManager.getRegularInterStyle(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(157, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Expanded(
            child: ListView.separated(
              itemCount: state.movies.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder:
                  (context, index) =>
                      CommonMovieListItem(searchEntity: state.movies[index]),
            ),
          );
        } else {
          return Center(child: SizedBox());
        }
      },
    );
  }
}
