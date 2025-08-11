import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/new_release/new_release_cubit.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/recommended/recommended_cubit.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/new_releases_section.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/recommended_section.dart';
import 'package:scene/features/home/widgets/popular/presentation/widgets/popular_slider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PopularSlider(),
          SizedBox(height: 24.h), // Spacing between popular slider and sections
          BlocProvider(
            create: (context) => getIt.get<NewReleaseCubit>(),
            child: NewReleasesSection()),
          SizedBox(height: 20.h), // Spacing between sections
          BlocProvider(
            create: (context) => getIt.get<RecommendedCubit>(),
            child: RecommendedSection()),
        ],
      ),
    );
  }
}
