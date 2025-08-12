import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/presentation/widgets/common_movie_list.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/categories/data/models/genres_response_model/genre.dart';
import 'package:scene/features/categories/presentation/cubit/categorized_movies/categories_cubit.dart';
import 'package:scene/features/categories/presentation/cubit/categorized_movies/categories_states.dart';

class CategorisedMovieList extends StatefulWidget {
  const CategorisedMovieList({super.key, required this.info});
  final Genre info;

  @override
  State<CategorisedMovieList> createState() => _CategorisedMovieListState();
}

class _CategorisedMovieListState extends State<CategorisedMovieList> {
  late final CategoriesCubit _categoriesCubit = getIt.get<CategoriesCubit>();
  @override
  void initState() {
    _categoriesCubit.fetchCategories(widget.info.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.info.name ?? 'genre',
          style: FontManager.getRegularInterStyle(
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: BlocProvider.value(
        value: _categoriesCubit,
        child: BlocBuilder<CategoriesCubit, CategoriesStates>(
          builder: (context, state) {
            if (state is CategoriesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.selectedIcon),
              );
            } else if (state is CategoriesLoadedState) {
              return CommonMovieList(movies: state.movies);
            } else if (state is CategoriesErrorState) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: FontManager.getRegularInterStyle(
                    fontSize: 13.sp,

                    color: AppColors.selectedIcon,
                  ).copyWith(height: 1.5.h, decoration: TextDecoration.none),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
