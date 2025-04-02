import 'package:flutter_test_project/core/error.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_response.dart';
import 'package:flutter_test_project/features/home/domain/repositories/pokemon_list_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GetPokemonListTokenUseCase {
  final PokemonListRepository _pokemonListRepository;

  GetPokemonListTokenUseCase(this._pokemonListRepository);

  Future<Result<PokemonResponse, NetworkError>> execute() async {
    return await _pokemonListRepository.getPokemonList();
  }
}
