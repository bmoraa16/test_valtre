part of 'get_pokemon_list_bloc.dart';

abstract class GetPokemonListEvent extends Equatable {
  const GetPokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonInitializeEvent extends GetPokemonListEvent {
  const GetPokemonInitializeEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonDetailsEvent extends GetPokemonListEvent {
  const GetPokemonDetailsEvent();

  @override
  List<Object> get props => [];
}
