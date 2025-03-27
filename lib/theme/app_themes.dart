import 'package:flutter/material.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class AppThemes {
  static final lightColorScheme = ColorScheme(
    primary: AppColors.hbPink, // Lighter shade of blue
    secondary: AppColors.hbGreen, // Lighter shade of green
    surface: AppColors.hbWhite, // Surface colors for cards, dialogs, etc.
    background: AppColors.hbGreyAccent, // Background color for screens
    error: AppColors.hbRed, // Error color
    onPrimary: AppColors.hbWhite, // Text/icon color when on primary color
    onSecondary: AppColors.hbWhite, // Text/icon color when on secondary color
    onSurface: AppColors.hbBlueText, // Text color when on surface
    onBackground: AppColors.hbGreyText, // Text color when on background
    onError: AppColors.hbWhite, // Text color when on error
    brightness: Brightness.light, // Set for light theme
  );

  static final darkColorScheme = ColorScheme(
    primary: AppColors.hbPink, // Lighter shade of blue
    secondary: AppColors.hbGreen, // Lighter shade of green
    surface:
        AppColors.hbGreyBackground, // Surface colors for cards, dialogs, etc.
    background: AppColors.hbGreyAccent, // Background color for screens
    error: AppColors.hbRed, // Error color
    onPrimary: AppColors.hbWhite, // Text/icon color when on primary color
    onSecondary: AppColors.hbWhite, // Text/icon color when on secondary color
    onSurface: AppColors.hbWhite, // Text color when on surface
    onBackground: AppColors.hbGreyText, // Text color when on background
    onError: AppColors.hbWhite, // Text color when on error
    brightness: Brightness.dark, // Set for dark theme
  );
}
