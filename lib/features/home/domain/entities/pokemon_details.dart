import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_ability.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_sprites.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_stat.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_type.dart';

class PokemonDetails extends Equatable {
  final List<PokemonType> types;
  final int height;
  final int weight;
  final String id;
  final List<PokemonAbility> abilities;
  final List<PokemonStat> stats;
  final PokemonSprites sprites;

  const PokemonDetails({
    required this.types,
    required this.height,
    required this.weight,
    required this.id,
    required this.abilities,
    required this.stats,
    required this.sprites,
  });

  PokemonDetails copyWith({
    List<PokemonType>? types,
    int? height,
    int? weight,
    String? id,
    List<PokemonAbility>? abilities,
    List<PokemonStat>? stats,
    PokemonSprites? sprites,
  }) {
    return PokemonDetails(
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      id: id ?? this.id,
      abilities: abilities ?? this.abilities,
      stats: stats ?? this.stats,
      sprites: sprites ?? this.sprites,
    );
  }

  @override
  List<Object?> get props => [types, height, weight, abilities, stats, sprites];
}
