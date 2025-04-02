part of 'get_pokemon_list_bloc.dart';

abstract class GetPokemonState extends Equatable {
  const GetPokemonState();

  @override
  List<Object> get props => [];
}

class GetPokemonInitial extends GetPokemonState {}

class GetPokemonLoading extends GetPokemonState {}

class GetPokemonLoaded extends GetPokemonState {
  final List<PokemonResult> pokemonList;
  final List<PokemonDetails> pokemonDetail;

  const GetPokemonLoaded({
    required this.pokemonList,
    required this.pokemonDetail,
  });

  @override
  List<Object> get props => [pokemonList];
}

class DrSearchError extends GetPokemonState {
  final String message;
  const DrSearchError(this.message);

  @override
  List<Object> get props => [message];
}
