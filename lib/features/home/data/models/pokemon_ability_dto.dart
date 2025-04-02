import 'package:flutter_test_project/features/home/data/models/named_api_resource_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability_dto.g.dart';

@JsonSerializable()
class PokemonAbilityDto {
  final NamedApiResourceDto ability;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  const PokemonAbilityDto({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityDtoToJson(this);
}
