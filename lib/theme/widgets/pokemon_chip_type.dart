import 'package:flutter/material.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class PokemonChipType extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  const PokemonChipType({
    super.key,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: AppColors.grayScaleWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: backgroundColor,
          width: 0,
        ),
      ),
    );
  }
}
