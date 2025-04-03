import 'package:flutter_test_project/core/error.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class PokemonListRepository {
  Future<Result<PokemonResponse, NetworkError>> getPokemonList();

  Future<Result<PokemonResponse, NetworkError>> loadMorePokemonList({
    required String nextUrl,
  });

  Future<Result<PokemonDetails, NetworkError>> getPokemonDetails({
    required String pokemonIndex,
  });
}
