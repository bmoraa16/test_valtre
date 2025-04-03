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
  final bool isLoadingMore;

  const GetPokemonLoaded({
    required this.pokemonList,
    required this.pokemonDetail,
    this.isLoadingMore = false,
  });

  GetPokemonLoaded copyWith({
    List<PokemonResult>? pokemonList,
    List<PokemonDetails>? pokemonDetail,
    bool? isLoadingMore,
  }) {
    return GetPokemonLoaded(
      pokemonList: pokemonList ?? this.pokemonList,
      pokemonDetail: pokemonDetail ?? this.pokemonDetail,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [pokemonList, pokemonDetail, isLoadingMore];
}

class DrSearchError extends GetPokemonState {
  final String message;
  const DrSearchError(this.message);

  @override
  List<Object> get props => [message];
}
