import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@lazySingleton
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  Future<void> fetchConfigurationInfo() async {
    Future.delayed(const Duration(seconds: 5));
    try {} catch (_) {}
  }

  Future<void> validateConfigurationInfo() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(NavigateToOnboarding());
  }
}
