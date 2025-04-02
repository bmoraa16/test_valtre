// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbilityDto _$PokemonAbilityDtoFromJson(Map<String, dynamic> json) =>
    PokemonAbilityDto(
      ability:
          NamedApiResourceDto.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonAbilityDtoToJson(PokemonAbilityDto instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
