import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';
import 'package:flutter_test_project/core/constants/route_constants.dart';
import 'package:flutter_test_project/core/di/injection.dart';
import 'package:flutter_test_project/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  late final _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is NavigateToOnboarding) {
            context.go(RouteConstants.dashboardRoute);
          }
        },
        child: Container(
          color: Colors.blue,
          width: size.width,
          height: size.height,
          child: FittedBox(
            fit: BoxFit.none,
            clipBehavior: Clip.hardEdge,
            child: Lottie.asset(
              AppAssets.splashAnimation,
              frameRate: FrameRate.max,
              onLoaded: (p0) {
                _lottieController
                  ..duration = p0.duration
                  ..forward().whenComplete(
                    () async {
                      getIt<SplashCubit>().validateConfigurationInfo();
                    },
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
