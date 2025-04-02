import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites_dto.g.dart';

@JsonSerializable()
class PokemonSpritesDto {
  @JsonKey(name: 'front_default')
  final String frontDefault;

  const PokemonSpritesDto({
    required this.frontDefault,
  });

  factory PokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesDtoToJson(this);
}
