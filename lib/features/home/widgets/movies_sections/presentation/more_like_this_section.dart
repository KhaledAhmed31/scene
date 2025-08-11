import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/more_like_this/more_like_this_cubit.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/more_like_this/more_like_this_states.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/widgets/sections_widget.dart';

class MoreLikeThisSection extends StatefulWidget {
  const MoreLikeThisSection({super.key, required this.movieId});
  final int movieId;
  @override
  State<MoreLikeThisSection> createState() => _MoreLikeThisSectionState();
}

class _MoreLikeThisSectionState extends State<MoreLikeThisSection> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoreLikeThisCubit>(
      context,
    ).fetchMoreLikeThis((widget.movieId).toString());
    return BlocConsumer<MoreLikeThisCubit, MoreLikeThisState>(
      listener: (context, state) {
        if (state is MoreLikeThisErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is MoreLikeThisLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.selectedIcon),
          );
        } else if (state is MoreLikeThisLoadedState) {
          List<SectionsEntity> movies =
              context.read<MoreLikeThisCubit>().moreLikeThisMovies ?? [];
          if (movies.isEmpty) {
            return Center(
              child: Text(
                "NO MORE LIKE THIS",
                style: FontManager.getRegularInterStyle(
                  fontSize: 13.sp,
                  color: AppColors.grayTextColor,
                ),
              ),
            );
          }
          return SectionsWidget(
            sectionTitle: 'More Like This',
            movies: context.read<MoreLikeThisCubit>().moreLikeThisMovies ?? [],
            sectionType: SectionType.moreLikeThis,
          );
        }
        return SizedBox();
      },
    );
  }
}
