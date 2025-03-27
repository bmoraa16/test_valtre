import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardNavigationCubit extends Cubit<int> {
  final PageController _pageController;

  DashboardNavigationCubit()
      : _pageController = PageController(),
        super(0); // Initial page index is 0

  void init() => emit(0);

  /// Navigate to a specific page
  void navigateToPage(int index) {
    if (index != state) {
      pageController.jumpToPage(index);
      emit(index);
    }
  }

  PageController get pageController => _pageController;

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}
