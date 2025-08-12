import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scene/core/consts/assets/assets.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/ui/navigation_bar/nav_bar_item.dart';
import 'package:scene/features/categories/presentation/screens/category_tap.dart';
import 'package:scene/features/home/screen/home_tap.dart';
import 'package:scene/features/search/presentation/pages/search_tap.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_state.dart';
import 'package:scene/features/watchlist/presentation/pages/watchlist_tap.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeTap(),
    SearchTap(),
    CategoryTap(),
    WatchlistTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoadingState&&BlocProvider.of<WatchlistCubit>(context).watchlist==null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.selectedIcon),
            );
          }
          return IndexedStack(index: _selectedIndex, children: _pages);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          CustomNavBarItem(iconPath: Assets.homeIcon, label: 'Home'),
          CustomNavBarItem(iconPath: Assets.searchIcon, label: 'Search'),
          CustomNavBarItem(iconPath: Assets.browseIcon, label: 'Browse'),
          CustomNavBarItem(iconPath: Assets.watchlistIcon, label: 'Watchlist'),
        ],
      ),
    );
  }
}
