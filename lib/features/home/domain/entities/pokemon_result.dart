import 'package:equatable/equatable.dart';

class PokemonResult extends Equatable {
  final String name;
  final String url;

  const PokemonResult({
    required this.name,
    required this.url,
  });

  PokemonResult copyWith({
    String? name,
    String? url,
  }) {
    return PokemonResult(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
