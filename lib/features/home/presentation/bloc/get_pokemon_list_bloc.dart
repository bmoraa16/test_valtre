import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';
import 'package:flutter_test_project/features/home/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:flutter_test_project/features/home/domain/usecases/get_pokemon_list_use_case.dart';
import 'package:flutter_test_project/features/home/domain/usecases/load_more_pokemon_list_use_case.dart';
import 'package:injectable/injectable.dart';

part 'get_pokemon_list_event.dart';
part 'get_pokemon_list_state.dart';

enum SortType {
  number,
  name,
}

@singleton
class DrSearchBloc extends Bloc<GetPokemonListEvent, GetPokemonState> {
  final GetPokemonListTokenUseCase _getPokemonList;
  final GetPokemonDetailsUseCase _getPokemonDetails;
  final LoadMorePokemonListTokenUseCase _loadMorePokemonDetails;

  DrSearchBloc(
    this._getPokemonList,
    this._getPokemonDetails,
    this._loadMorePokemonDetails,
  ) : super(GetPokemonInitial()) {
    on<GetPokemonInitializeEvent>(_onInitialize);
    on<GetPokemonDetailsEvent>(_onGetPokemonDetails);
    on<ChangeSortEvent>(_onChangeSort);
    on<SearchPokemonEvent>(_onSearch);
    on<LoadMorePokemonEvent>(_onLoadMore);
  }

  bool get canLoadMore => _nextUrl != null && _nextUrl!.isNotEmpty;
  List<PokemonResult> _pokemonList = [];
  final List<PokemonDetails> _detailedPokemonList = [];
  String? _nextUrl;
  SortType _sortType = SortType.number;
  String _searchQuery = '';

  Future<void> _onInitialize(
    GetPokemonInitializeEvent event,
    Emitter<GetPokemonState> emit,
  ) async {
    emit(GetPokemonLoading());

    try {
      final pokemonListResult = await _getPokemonList.execute();

      pokemonListResult.when(
        (success) {
          _pokemonList = success.results;
          _nextUrl = success.next;
        },
        (error) {
          emit(const DrSearchError(AppDictionary.genericError));
          return;
        },
      );

      if (_pokemonList.isNotEmpty) {
        add(const GetPokemonDetailsEvent());
      } else {
        emit(const GetPokemonLoaded(
          pokemonList: [],
          pokemonDetail: [],
        ));
      }
    } catch (e) {
      emit(DrSearchError('${AppDictionary.genericError}: $e'));
    }
  }

  Future<void> _onGetPokemonDetails(
    GetPokemonDetailsEvent event,
    Emitter<GetPokemonState> emit,
  ) async {
    if (_pokemonList.isEmpty) {
      emit(const DrSearchError(
        'No se encontró la lista inicial de pokémon para obtener detalles.',
      ));
      return;
    }

    emit(GetPokemonLoading());

    try {
      final allDetailResults = await Future.wait(
        _pokemonList.map((pokemon) async {
          final detailEither = await _getPokemonDetails.execute(pokemon.url);
          return detailEither;
        }),
      );

      final List<PokemonDetails> newDetails = [];

      for (final eitherResult in allDetailResults) {
        eitherResult.when(
          (successDetail) {
            newDetails.add(successDetail);
          },
          (failure) {
            print("Error al obtener detalles de un Pokémon: $failure");
          },
        );
      }

      _detailedPokemonList.addAll(newDetails);

      final filteredAndSorted = _applyFiltersAndSorting();

      emit(
        GetPokemonLoaded(
          pokemonList: filteredAndSorted.results,
          pokemonDetail: filteredAndSorted.details,
        ),
      );
    } catch (e) {
      emit(DrSearchError('${AppDictionary.genericError}: $e'));
    }
  }

  Future<void> _onChangeSort(
    ChangeSortEvent event,
    Emitter<GetPokemonState> emit,
  ) async {
    _sortType = event.sortType;

    final filteredAndSorted = _applyFiltersAndSorting();

    emit(
      GetPokemonLoaded(
        pokemonList: filteredAndSorted.results,
        pokemonDetail: filteredAndSorted.details,
      ),
    );
  }

  Future<void> _onSearch(
    SearchPokemonEvent event,
    Emitter<GetPokemonState> emit,
  ) async {
    _searchQuery = event.query;

    final filteredAndSorted = _applyFiltersAndSorting();

    emit(
      GetPokemonLoaded(
        pokemonList: filteredAndSorted.results,
        pokemonDetail: filteredAndSorted.details,
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMorePokemonEvent event,
    Emitter<GetPokemonState> emit,
  ) async {
    if (_nextUrl == null || _nextUrl!.isEmpty) {
      final filteredAndSorted = _applyFiltersAndSorting();
      emit(
        GetPokemonLoaded(
          pokemonList: filteredAndSorted.results,
          pokemonDetail: filteredAndSorted.details,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final currentState = state;
    if (currentState is GetPokemonLoaded) {
      emit(currentState.copyWith(isLoadingMore: true));
    }

    try {
      final pokemonListResult =
          await _loadMorePokemonDetails.execute(_nextUrl ?? '');

      List<PokemonResult> morePokemon = [];

      pokemonListResult.when(
        (success) {
          morePokemon = success.results;
          _nextUrl = success.next;
        },
        (error) {
          emit(const DrSearchError(AppDictionary.genericError));
        },
      );

      if (morePokemon.isEmpty) {
        final filteredAndSorted = _applyFiltersAndSorting();
        emit(
          GetPokemonLoaded(
            pokemonList: filteredAndSorted.results,
            pokemonDetail: filteredAndSorted.details,
            isLoadingMore: false,
          ),
        );
        return;
      }

      _pokemonList.addAll(morePokemon);

      final allDetailResults = await Future.wait(
        morePokemon.map((pokemon) async {
          final detailEither = await _getPokemonDetails.execute(pokemon.url);
          return detailEither;
        }),
      );

      for (final eitherResult in allDetailResults) {
        eitherResult.when(
          (successDetail) {
            _detailedPokemonList.add(successDetail);
          },
          (failure) {
            print("Error al obtener detalles de un Pokémon: $failure");
          },
        );
      }

      final filteredAndSorted = _applyFiltersAndSorting();

      emit(
        GetPokemonLoaded(
          pokemonList: filteredAndSorted.results,
          pokemonDetail: filteredAndSorted.details,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(DrSearchError('${AppDictionary.genericError}: $e'));
    }
  }

  _FilteredData _applyFiltersAndSorting() {
    final combined = <(PokemonResult, PokemonDetails)>[];

    for (int i = 0; i < _pokemonList.length; i++) {
      if (i < _detailedPokemonList.length) {
        combined.add((_pokemonList[i], _detailedPokemonList[i]));
      }
    }

    if (_searchQuery.isNotEmpty) {
      final queryLower = _searchQuery.toLowerCase();
      combined.retainWhere(
        (tuple) => tuple.$1.name.toLowerCase().contains(queryLower),
      );
    }

    combined.sort((a, b) {
      switch (_sortType) {
        case SortType.number:
          final idA = int.tryParse(a.$2.id) ?? 0;
          final idB = int.tryParse(b.$2.id) ?? 0;
          return idA.compareTo(idB);

        case SortType.name:
          return a.$1.name.compareTo(b.$1.name);
      }
    });

    final filteredResults = combined.map((e) => e.$1).toList();
    final filteredDetails = combined.map((e) => e.$2).toList();

    return _FilteredData(
      results: filteredResults,
      details: filteredDetails,
    );
  }
}

class _FilteredData {
  final List<PokemonResult> results;
  final List<PokemonDetails> details;
  _FilteredData({required this.results, required this.details});
}
