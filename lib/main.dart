import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/routing/routing_manager.dart';
import 'package:scene/core/services/injector.dart';
import 'package:scene/core/ui/theme/app_theme.dart';
import 'package:scene/features/main_layout/main_layout.dart';
import 'package:scene/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:scene/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'core/notifications/notification_service.dart';
import 'firebase_options.dart';

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  configureDependencies();
  String? token = await FirebaseMessaging.instance.getToken();
  log(token!);
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'scene',
          // You can use the library anywhere in the app even in theme
          theme: AppTheme.appTheme,
          routerConfig: router,
        );
      },
      child: MainLayout(),
    );
  }
}
