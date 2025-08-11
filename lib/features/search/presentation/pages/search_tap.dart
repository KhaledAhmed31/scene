import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/search/presentation/cubit/search_cubit.dart';
import 'package:scene/features/search/presentation/widgets/search_bar.dart';
import 'package:scene/features/search/presentation/widgets/search_movies_list.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SearchCubit>(),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          spacing: 20.h,
          children: [CustomSearchBar(), SearchMoviesList()],
        ),
      ),
    );
  }
}
