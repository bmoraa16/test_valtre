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

class ChangeSortEvent extends GetPokemonListEvent {
  final SortType sortType;
  const ChangeSortEvent(this.sortType);

  @override
  List<Object> get props => [sortType];
}

class SearchPokemonEvent extends GetPokemonListEvent {
  final String query;
  const SearchPokemonEvent(this.query);

  @override
  List<Object> get props => [query];
}

class LoadMorePokemonEvent extends GetPokemonListEvent {
  const LoadMorePokemonEvent();
}
