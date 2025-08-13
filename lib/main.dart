import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/routing/routing_manager.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/core/ui/theme/app_theme.dart';
import 'package:scene/features/main_layout/main_layout.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'firebase_options.dart';

import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocProvider(
          create: (context) => getIt.get<WatchlistCubit>()..getWatchlist(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'scene',
            // You can use the library anywhere in the app even in theme
            theme: AppTheme.appTheme,
            routerConfig: router,
          ),
        );
      },
      child: MainLayout(),
    );
  }
}
