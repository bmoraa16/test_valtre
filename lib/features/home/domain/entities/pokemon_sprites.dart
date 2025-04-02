import 'package:equatable/equatable.dart';

class PokemonSprites extends Equatable {
  final String frontDefault;

  const PokemonSprites({
    required this.frontDefault,
  });

  PokemonSprites copyWith({
    String? frontDefault,
  }) {
    return PokemonSprites(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  @override
  List<Object?> get props => [frontDefault];
}
