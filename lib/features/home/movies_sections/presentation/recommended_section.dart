import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/consts/enums/app_enums.dart';
import 'package:scene/features/home/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/movies_sections/presentation/cubit/recommended/recommended_cubit.dart';
import 'package:scene/features/home/movies_sections/presentation/cubit/recommended/recommended_states.dart';
import 'package:scene/features/home/movies_sections/presentation/widgets/sections_widget.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendedCubit, RecommendedState>(
      listener: (context, state) {
        if (state is RecommendedErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is RecommendedLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.selectedIcon),
          );
        } else if (state is RecommendedLoadedState) {
          List<SectionsEntity> movies =
              BlocProvider.of<RecommendedCubit>(context).recommendedMovies!;
          return SectionsWidget(
            sectionTitle: 'Recommended',
            movies: movies,
            sectionType: SectionType.recommended,
          );
        }
        return SizedBox();
      },
    );
  }
}
