import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/route_constants.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/pokemon_card.dart';
import 'package:flutter_test_project/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<PokemonResult> pokemonList;
  final List<PokemonDetails> pokemonDetails;

  const PokemonGridWidget({
    super.key,
    required this.pokemonList,
    required this.pokemonDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pokemonList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 170,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 104 / 108,
      ),
      itemBuilder: (context, index) {
        final detail = pokemonDetails[index];
        final pokemon = pokemonList[index];
        return PokemonCard(
          number: detail.id,
          pokemonName: pokemon.name,
          pokemonImage: detail.sprites.frontDefault,
          onTap: () {
            context.push(
              RouteConstants.detailsPokemon,
              extra: {
                "colorType": PokemonTypeColorMapper.getColorFromType(
                    detail.types[0].type.name),
                "pokemon": pokemon,
                "pokemonDetails": detail,
              },
            );
          },
        );
      },
    );
  }
}
