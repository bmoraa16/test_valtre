import 'package:flutter_test_project/features/home/data/models/pokemon_ability_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_sprites_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_stat_dto.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_type_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_dto.g.dart';

@JsonSerializable()
class PokemonDetailsDto {
  final List<PokemonTypeDto> types;
  final int height;
  final int id;
  final int weight;
  final List<PokemonAbilityDto> abilities;
  final List<PokemonStatDto> stats;
  final PokemonSpritesDto sprites;

  const PokemonDetailsDto({
    required this.types,
    required this.height,
    required this.weight,
    required this.id,
    required this.abilities,
    required this.stats,
    required this.sprites,
  });

  factory PokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsDtoToJson(this);
}
