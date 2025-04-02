import 'package:flutter_test_project/core/error.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_response_dto.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class PokemonListDataSource {
  Future<Result<PokemonResponseDto, NetworkError>> getPokemonList();
}
