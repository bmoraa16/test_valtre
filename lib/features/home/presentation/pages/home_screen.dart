import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/features/home/presentation/bloc/get_pokemon_list_bloc.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/pokemon_card.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<DrSearchBloc>().add(const GetPokemonInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DrSearchBloc, GetPokemonState>(
        builder: (context, state) {
          if (state is GetPokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetPokemonLoaded) {
            return Container(
              color: AppColors.hbRedPrimary,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Pokédex',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.grayScaleWhite,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.pokemonList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 170,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 104 / 108,
                        ),
                        itemBuilder: (context, index) {
                          final detail = state.pokemonDetail[index];
                          final pokemon = state.pokemonList[index];
                          return PokemonCard(
                            number: detail.id,
                            pokemonName: pokemon.name,
                            pokemonImage: detail.sprites.frontDefault,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(AppDictionary.genericError),
            );
          }
        },
      ),
    );
  }
}
