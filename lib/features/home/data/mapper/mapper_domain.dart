import 'package:flutter_test_project/features/home/data/models/named_api_resource_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_ability_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_details_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_response_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_result_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_sprites_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_stat_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_type_dto.dart';
import 'package:flutter_test_project/features/home/domain/entities/named_api_resource.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_ability.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_response.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_sprites.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_stat.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_type.dart';

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

extension MapperPokemonDetailsDto on PokemonDetailsDto {
  PokemonDetails get toDomain {
    return PokemonDetails(
      sprites: sprites.toDomain,
      types: types.map((results) => results.toDomain).toList(),
      weight: weight,
      height: height,
      id: id.toString(),
      abilities: abilities.map((results) => results.toDomain).toList(),
      stats: stats.map((results) => results.toDomain).toList(),
    );
  }
}

extension MapperPokemonTypeDto on PokemonTypeDto {
  PokemonType get toDomain {
    return PokemonType(
      slot: slot,
      type: type.toDomain,
    );
  }
}

extension MapperPokemonAbilityDto on PokemonAbilityDto {
  PokemonAbility get toDomain {
    return PokemonAbility(
      ability: ability.toDomain,
      isHidden: isHidden,
      slot: slot,
    );
  }
}

extension MapperPokemonStatDto on PokemonStatDto {
  PokemonStat get toDomain {
    return PokemonStat(
      baseStat: baseStat,
      effort: effort,
      stat: stat.toDomain,
    );
  }
}

extension MapperPokemonSpritesDto on PokemonSpritesDto {
  PokemonSprites get toDomain {
    return PokemonSprites(
      frontDefault: frontDefault,
    );
  }
}

extension MapperNamedApiResourceDto on NamedApiResourceDto {
  NamedApiResource get toDomain {
    return NamedApiResource(
      name: name,
      url: url,
    );
  }
}
