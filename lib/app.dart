import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/di/injection.dart';
import 'package:flutter_test_project/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:flutter_test_project/router/router.dart';
import 'package:flutter_test_project/theme/dark_mode_theme.dart';
import 'package:flutter_test_project/theme/light_mode_theme.dart';
import 'package:sizer/sizer.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardNavigationCubit>(
          create: (context) => getIt<DashboardNavigationCubit>(),
        ),
      ],
      child: Sizer(builder: (_, __, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'HealthBird',
          routerConfig: TestRouter.router,
          theme: getLightModeThemeData(),
          darkTheme: getDarkModeThemeData(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      }),
    );
  }
}
