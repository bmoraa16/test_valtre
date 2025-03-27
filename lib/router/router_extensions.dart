import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtension on BuildContext {
  void safePop() {
    final router = GoRouter.of(this);
    if (router.canPop()) {
      router.pop(this);
    } else {
      debugPrint("There is nothing to pop");
    }
  }

  void popUntil(String routeName) {
    final router = GoRouter.of(this);
    while (router.canPop()) {
      if (router.state?.fullPath == routeName) break;
      router.pop();
    }
    if (router.state?.fullPath != routeName) debugPrint("Route not found");
  }

  void popUntilCount(int count) {
    final router = Navigator.of(this);
    int popCount = 0;

    while (router.canPop() && popCount < count) {
      router.pop();
      popCount++;
    }
  }
}
