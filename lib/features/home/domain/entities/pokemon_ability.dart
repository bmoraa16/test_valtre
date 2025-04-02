import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/domain/entities/named_api_resource.dart';

class PokemonAbility extends Equatable {
  final NamedApiResource ability;
  final bool isHidden;
  final int slot;

  const PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  PokemonAbility copyWith({
    NamedApiResource? ability,
    bool? isHidden,
    int? slot,
  }) {
    return PokemonAbility(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  @override
  List<Object?> get props => [ability, isHidden, slot];
}
