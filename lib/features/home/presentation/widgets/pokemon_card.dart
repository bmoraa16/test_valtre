import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/extensions/string_extensions.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/pokemon_image.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.number,
    required this.pokemonName,
    required this.pokemonImage,
    required this.onTap,
  });
  final String number;
  final String pokemonName;
  final String pokemonImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.grayScaleWhite,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          padding: const EdgeInsets.only(
            top: 2,
            left: 8,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '#$number',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    color: AppColors.grayScaleMedium,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: PokemonImageWidget(
                  pokemonImage: pokemonImage,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  pokemonName.toCapitalized(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: AppColors.grayScaleDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
