import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/di/injection.dart';
import 'package:flutter_test_project/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:flutter_test_project/features/dashboard/utils/loading_mixin.dart';
import 'package:flutter_test_project/theme/app_colors.dart';
import 'package:flutter_test_project/theme/widgets/hb_scaffold_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver, LoadingMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getIt<DashboardNavigationCubit>().init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HbScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: getIt<DashboardNavigationCubit>().pageController,
        children: [
          Container(
            color: AppColors.hbRedPrimary,
          )
        ],
      ),
    );
  }
}
