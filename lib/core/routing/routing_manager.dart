import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scene/core/routing/routing_paths.dart';
import 'package:scene/features/categories/data/models/genres_response_model/genre.dart';
import 'package:scene/features/categories/presentation/screens/categorised_movie_list.dart';
import 'package:scene/features/main_layout/main_layout.dart';
import 'package:scene/features/movie_details/presentation/screens/movie_details_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutingPaths.mainLayout,
  routes: [
    GoRoute(
      path: RoutingPaths.mainLayout,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MainLayout(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            reverseTransitionDuration: Duration(milliseconds: 300),
          ),
      routes: [
        GoRoute(
          path: RoutingPaths.movieDetails,
          pageBuilder:
              (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: MovieDetailsScreen(movieId: state.extra as int),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                reverseTransitionDuration: Duration(milliseconds: 300),
              ),
        ),
        GoRoute(path:RoutingPaths.categorisedMoviesList,
         pageBuilder:
              (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: CategorisedMovieList(info: state.extra as Genre,),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                reverseTransitionDuration: Duration(milliseconds: 300),
              ),
         )
      ],
    ),
  ],
);
