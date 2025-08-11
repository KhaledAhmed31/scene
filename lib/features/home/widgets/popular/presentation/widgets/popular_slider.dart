import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/movies/entity/movie_card_entity.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/home/widgets/popular/presentation/cubit/popular_cubit.dart';
import 'package:scene/features/home/widgets/popular/presentation/cubit/popular_state.dart';
import 'package:scene/features/home/widgets/popular/presentation/widgets/slider_item.dart';

class PopularSlider extends StatefulWidget {
  const PopularSlider({super.key});

  @override
  State<PopularSlider> createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  final PopularCubit popularCubit = getIt.get<PopularCubit>();
  List<MovieEntity>? posters;
  late Timer timer;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: (9999 * 9999));
    timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      _pageController.animateToPage(
        _pageController.page!.round() + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  dispose() {
    timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => popularCubit..fetchPopularMovies(),
      child: BlocBuilder<PopularCubit, PopularState>(
        
        builder: (context, state) {
          if (state is PopularLoadingState) {
            return SizedBox(
              height: 289.h,
              width: screenWidth,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.selectedIcon),
              ),
            );
          } else if (state is PopularLoadedState) {
            posters =
                popularCubit.posters!.movies ?? [];
            return SizedBox(
              height: 289.h,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SliderItem(
                    movieEntity: posters![index % posters!.length],
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
