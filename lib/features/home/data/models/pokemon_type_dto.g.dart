// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypeDto _$PokemonTypeDtoFromJson(Map<String, dynamic> json) =>
    PokemonTypeDto(
      slot: (json['slot'] as num).toInt(),
      type: NamedApiResourceDto.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeDtoToJson(PokemonTypeDto instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
