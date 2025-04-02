import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';

class PokemonImageWidget extends StatelessWidget {
  final String? pokemonImage;
  final double? height;

  const PokemonImageWidget({
    super.key,
    this.pokemonImage,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isValidUrl = pokemonImage != null && pokemonImage!.isNotEmpty;
    final imageUrl = isValidUrl ? "$pokemonImage" : null;

    return Container(
      child: isValidUrl
          ? Image.network(
              imageUrl!,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppAssets.pokemonSiluete,
                  fit: BoxFit.cover,
                );
              },
            )
          : Image.asset(
              AppAssets.pokemonSiluete,
              fit: BoxFit.cover,
              height: height,
            ),
    );
  }
}
