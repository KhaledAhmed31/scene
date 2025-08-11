import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/font/font_manager.dart';
import 'package:scene/core/movies/presentation/widgets/common_movie_list.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_state.dart';

class WatchlistTap extends StatelessWidget {
  const WatchlistTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 20.h),
      child: Column(
        spacing: 40.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watchlist',
            style: FontManager.getRegularInterStyle(
              fontSize: 22.sp,
              color: Colors.white,
            ),
          ),
          BlocBuilder<WatchlistCubit, WatchlistState>(
            
            builder: (context, state) {
              if(state is WatchlistLoadingState){
                return Expanded(
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.selectedIcon),
                  ),
                );
              }
              else if(state is WatchlistLoadedState){
                return Expanded(child: CommonMovieList(movies: state.watchlist));
              }
              else if(state is WatchlistErrorState){
                return Expanded(child: Center(child: Text(
              state.message,textAlign: TextAlign.center,
              style: FontManager.getRegularInterStyle(
                fontSize: 13.sp,
                
                color: AppColors.selectedIcon,
              ).copyWith(height: 1.5.h,decoration: TextDecoration.none),
            ),));
              }
              return Container();
            })
        ],
      ),
    );
  }
}