import 'package:flutter_test_project/features/home/data/models/pokemon_response_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_result_dto.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_response.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';

extension MapperPokemonResponseDto on PokemonResponseDto {
  PokemonResponse get toDomain {
    return PokemonResponse(
      count: count,
      next: next,
      previous: previous,
      results: results.map((results) => results.toDomain).toList(),
    );
  }
}

extension MapperPokemonResultDto on PokemonResultDto {
  PokemonResult get toDomain {
    return PokemonResult(
      name: name,
      url: url,
    );
  }
}
