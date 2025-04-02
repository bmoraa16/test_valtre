import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/extensions/color_extensions.dart';
import 'package:flutter_test_project/theme/app_colors.dart';
import 'package:flutter_test_project/theme/app_themes.dart';

ThemeData getLightModeThemeData() {
  final primaryColor = AppColors.hbPink.getMaterialColor();
  final secondaryColor = AppColors.hbBlueAccent.getMaterialColor();
  final labelColor = AppColors.grayScaleDark.getMaterialColor();
  final inputColor = AppColors.hbVioletText.getMaterialColor();
  final placeholderColor = AppColors.hbGrey.withOpacity(0.5);
  final backgroundColor = AppColors.hbWhite.getMaterialColor();
  return ThemeData(
    fontFamily: 'Poppins',
    colorScheme: AppThemes.lightColorScheme,
    iconTheme: IconThemeData(color: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      floatingLabelStyle: TextStyle(
        color: labelColor,
        fontSize: 12,
      ),
      labelStyle: TextStyle(
        color: inputColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(
        color: placeholderColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      disabledBorder: InputBorder.none,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: labelColor),
      bodyMedium: TextStyle(color: labelColor, fontSize: 16),
      bodyLarge: TextStyle(color: labelColor, fontSize: 16),
      titleLarge: TextStyle(color: secondaryColor, fontSize: 18),
      titleMedium: TextStyle(color: secondaryColor),
      titleSmall: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        disabledBackgroundColor: AppColors.hbBluishGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: primaryColor),
      ),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Colors.white,
      color: Colors.white,
    ),
    dialogBackgroundColor: backgroundColor,
    dialogTheme: DialogTheme(
      alignment: Alignment.center,
      surfaceTintColor: Colors.white,
      titleTextStyle: TextStyle(
        color: labelColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: backgroundColor,
    datePickerTheme: DatePickerThemeData(
      surfaceTintColor: Colors.white,
      headerBackgroundColor: primaryColor,
      headerForegroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: AppColors.grayScaleWhite,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.grayScaleWhite,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      unselectedLabelStyle: const TextStyle(fontSize: 16),
      indicatorColor: primaryColor,
      labelColor: primaryColor,
      unselectedLabelColor: Colors.black54,
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: labelColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
