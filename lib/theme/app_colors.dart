import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/extensions/string_extensions.dart';

abstract class AppColors {
  static final Color hbWhite = "#FFFDFAFC".toColor();
  static final Color hbBlue = "#503d76".toColor();
  static final Color hbBlueAccent = "#8A4ABD".toColor();
  static final Color hbPink = "#FC3894".toColor();
  static final Color hbGreen = "#1FC690".toColor();
  static final Color hbGrey = "#666680".toColor();
  static final Color hbGreyAccent = "#FDFAFC".toColor();
  static final Color hbBluishGrey = "#b2b3d5".toColor();
  static final Color hbGreyText = "#b2b3d5".toColor();
  static final Color hbGreySecondary = "#eae3ee".toColor();
  static final Color hbVioletText = "#956fab".toColor();
  static final Color hbGreyBackground = "#d5d6e9".toColor();
  static final Color hbRed = "#ed3a4e".toColor();
  static final Color hbBlueText = "#3a2a5d".toColor();
  static final Color hbRedPrimary = "#DC0A2D".toColor();

  static List<Color> getHomeGradientColors() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour >= 6 && hour < 12) return [const Color(0xFFf0f0df), Colors.white];
    if (hour >= 12 && hour < 18) return [const Color(0xFFd8eaea), Colors.white];
    if (hour >= 18 && hour < 21) return [const Color(0xFFede3de), Colors.white];
    return [const Color(0xFFd6d9eb), Colors.white];
  }

// Gradients
  static final rxCardGradientColors = [
    hbBlue,
    hbBlue,
    hbBlue,
    hbPink,
    hbPink,
    hbPink,
  ];
}
