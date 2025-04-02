import 'package:flutter_test_project/features/home/data/models/pokemon_result_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response_dto.g.dart';

@JsonSerializable()
class PokemonResponseDto {
  final int count;

  final String? next;

  final String? previous;

  final List<PokemonResultDto> results;

  const PokemonResponseDto({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseDtoToJson(this);
}
