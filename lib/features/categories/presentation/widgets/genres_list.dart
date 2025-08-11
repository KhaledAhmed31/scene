import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/categories/presentation/cubit/genres/genres_cubit.dart';
import 'package:scene/features/categories/presentation/cubit/genres/genres_state.dart';
import 'package:scene/features/categories/presentation/widgets/genre_card.dart';

class GenresList extends StatelessWidget {
  const GenresList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<GenresCubit>()..fetchGenres(),
      child: BlocBuilder<GenresCubit, GenresState>(
        builder: (context, state) {
          if (state is GenresLoadingState) {
            return Expanded(
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.selectedIcon),
              ),
            );
          } else if (state is GenresLoadedState) {
            return Expanded(
              child: GridView.builder(
                itemCount: state.genres.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 38.w,
                  mainAxisSpacing: 47.h,
                  mainAxisExtent: 90.h,
                ),
                itemBuilder:
                    (context, index) => GenreCard(
                      imageUrl: 'assets/images/${state.genres[index].name}.jpg',
                      genre: state.genres[index],
                    ),
              ),
            );
          } else if (state is GenresErrorState) {
            return Expanded(child: Center(child: Text(state.message)));
          }
          return Expanded(child: const Center(child: Text("No Genres")));
        },
      ),
    );
  }
}
