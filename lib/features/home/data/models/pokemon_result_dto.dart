import 'package:json_annotation/json_annotation.dart';

part 'pokemon_result_dto.g.dart';

@JsonSerializable()
class PokemonResultDto {
  final String name;

  final String url;

  const PokemonResultDto({
    required this.name,
    required this.url,
  });

  factory PokemonResultDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResultDtoToJson(this);
}
