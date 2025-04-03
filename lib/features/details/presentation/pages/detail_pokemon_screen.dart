import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/core/extensions/num_extensions.dart';
import 'package:flutter_test_project/features/details/presentation/widgets/about_table.dart';
import 'package:flutter_test_project/features/details/presentation/widgets/app_bar_pokemon_details.dart';
import 'package:flutter_test_project/features/details/presentation/widgets/pokemon_chip_type.dart';
import 'package:flutter_test_project/features/details/presentation/widgets/stats_pokemon.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/pokemon_image.dart';
import 'package:flutter_test_project/theme/app_colors.dart';
import 'package:flutter_test_project/theme/background_pokemon_type.dart';

class DetailPokemonScreen extends StatelessWidget {
  final Color colorType;
  final PokemonResult pokemon;
  final PokemonDetails pokemonDetails;

  const DetailPokemonScreen({
    super.key,
    required this.colorType,
    required this.pokemon,
    required this.pokemonDetails,
  });

  @override
  Widget build(BuildContext context) {
    final abilities = pokemonDetails.abilities;

    final names = abilities.map((item) => item.ability.name).toList();

    final abilitiesJoined = names.join(',\n');
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBarHomePokemonDetails(
        pokemonId: pokemonDetails.id,
        pokemonName: pokemon.name,
        pokemonType: PokemonTypeColorMapper.getColorFromType(
          pokemonDetails.types[0].type.name,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: backgroundPokemonType(
              overlayColor: PokemonTypeColorMapper.getColorFromType(
                pokemonDetails.types[0].type.name,
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    40.ph,
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final typeInfo in pokemonDetails.types)
                          PokemonChipType(
                            label: typeInfo.type.name,
                            backgroundColor:
                                PokemonTypeColorMapper.getColorFromType(
                              pokemonDetails.types[0].type.name,
                            ),
                          )
                      ],
                    ),
                    16.ph,
                    AboutTable(
                      kg: pokemonDetails.weight.toString(),
                      m: pokemonDetails.weight.toString(),
                      moves: abilitiesJoined,
                      pokemonType: PokemonTypeColorMapper.getColorFromType(
                        pokemonDetails.types[0].type.name,
                      ),
                    ),
                    30.ph,
                    Text(
                      AppDictionary.descriptionExample,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.grayScaleDark,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    30.ph,
                    Text(
                      AppDictionary.baseStats,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: PokemonTypeColorMapper.getColorFromType(
                          pokemonDetails.types[0].type.name,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    16.ph,
                    BaseStatsSection(
                      pokemonDetails: pokemonDetails,
                      pokemonType: PokemonTypeColorMapper.getColorFromType(
                        pokemonDetails.types[0].type.name,
                      ),
                      hp: pokemonDetails.stats[0].baseStat,
                      atk: pokemonDetails.stats[1].baseStat,
                      def: pokemonDetails.stats[2].baseStat,
                      satk: pokemonDetails.stats[3].baseStat,
                      sdef: pokemonDetails.stats[4].baseStat,
                      spd: pokemonDetails.stats[5].baseStat,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
                child: SizedBox(
              height: 250,
              child: PokemonImageWidget(
                pokemonImage: pokemonDetails.sprites.frontDefault,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
