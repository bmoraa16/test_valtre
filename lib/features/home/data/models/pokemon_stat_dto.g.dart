// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatDto _$PokemonStatDtoFromJson(Map<String, dynamic> json) =>
    PokemonStatDto(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: NamedApiResourceDto.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatDtoToJson(PokemonStatDto instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
