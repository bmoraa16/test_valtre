import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';

BoxDecoration backgroundPokemonType({required Color overlayColor}) {
  return BoxDecoration(
    image: DecorationImage(
      image: const AssetImage(AppAssets.backgroundPokemonType),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        overlayColor,
        BlendMode.color,
      ),
    ),
  );
}
