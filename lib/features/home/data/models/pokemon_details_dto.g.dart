// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDto _$PokemonDetailsDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailsDto(
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbilityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites:
          PokemonSpritesDto.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDetailsDtoToJson(PokemonDetailsDto instance) =>
    <String, dynamic>{
      'types': instance.types,
      'height': instance.height,
      'id': instance.id,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'stats': instance.stats,
      'sprites': instance.sprites,
    };
