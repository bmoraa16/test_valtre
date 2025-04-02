import 'package:flutter_test_project/core/error.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/repositories/pokemon_list_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GetPokemonDetailsUseCase {
  final PokemonListRepository _pokemonDetailsRepository;

  GetPokemonDetailsUseCase(this._pokemonDetailsRepository);

  Future<Result<PokemonDetails, NetworkError>> execute(
      String pokemonIndex) async {
    return await _pokemonDetailsRepository.getPokemonDetails(
      pokemonIndex: pokemonIndex,
    );
  }
}
