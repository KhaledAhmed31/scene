import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/features/home/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/movies_sections/presentation/cubit/new_release/new_release_cubit.dart';
import 'package:scene/features/home/movies_sections/presentation/cubit/new_release/new_release_states.dart';
import 'package:scene/features/home/movies_sections/presentation/widgets/sections_widget.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewReleaseCubit, NewReleaseState>(
      listener: (context, state) {
        if (state is NewReleaseErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is NewReleaseLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.selectedIcon),
          );
        } else if (state is NewReleaseLoadedState) {
          List<SectionsEntity> movies =
              BlocProvider.of<NewReleaseCubit>(context).newMovies!;
          if (movies.isEmpty) {
            return Center(
              child: Text(
                'No Movies',
                style: FontManager.getRegularInterStyle(
                  fontSize: 13.sp,
                  color: AppColors.grayTextColor,
                ),
              ),
            );
          }
          return SectionsWidget(
            sectionTitle: 'New Releases',
            movies: movies,
            sectionType: SectionType.newRelease,
          );
        }
        return Center(
          child: Text(
            'No Movies',
            style: FontManager.getRegularInterStyle(
              fontSize: 13.sp,
              color: AppColors.grayTextColor,
            ),
          ),
        );
      },
    );
  }
}
