import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/constants/route_constants.dart';
import 'package:flutter_test_project/core/di/injection.dart';
import 'package:flutter_test_project/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:flutter_test_project/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:flutter_test_project/features/home/presentation/bloc/get_pokemon_list_bloc.dart';
import 'package:flutter_test_project/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_test_project/features/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

class TestRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteConstants.initialRoute,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider.value(
            value: getIt<SplashCubit>()..fetchConfigurationInfo(),
            child: const SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteConstants.dashboardRoute,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<DashboardNavigationCubit>()),
              BlocProvider.value(value: getIt<DrSearchBloc>()),
            ],
            child: const DashboardScreen(),
          );
        },
      ),
    ],
  );
}
