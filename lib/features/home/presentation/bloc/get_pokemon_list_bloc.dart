import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';
import 'package:flutter_test_project/features/home/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:flutter_test_project/features/home/domain/usecases/get_pokemon_list_use_case.dart';
import 'package:injectable/injectable.dart';

part 'get_pokemon_list_event.dart';
part 'get_pokemon_list_state.dart';

@singleton
class DrSearchBloc extends Bloc<GetPokemonListEvent, GetPokemonState> {
  final GetPokemonListTokenUseCase _getPokemonList;
  final GetPokemonDetailsUseCase _getPokemonDetails;

  DrSearchBloc(
    this._getPokemonList,
    this._getPokemonDetails,
  ) : super(GetPokemonInitial()) {
    on<GetPokemonInitializeEvent>(_onInitialize);
    on<GetPokemonDetailsEvent>(_onGetPokemonDetails);
  }

  List<PokemonResult>? _pokemonList;
  List<PokemonDetails> _detailedPokemonList = [];

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
        },
        (error) {
          emit(const DrSearchError(AppDictionary.genericError));
        },
      );

      if (_pokemonList != null && _pokemonList!.isNotEmpty) {
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
    if (_pokemonList == null) {
      emit(const DrSearchError(
        'No se encontró la lista inicial de pokémon para obtener detalles.',
      ));
      return;
    }

    emit(GetPokemonLoading());

    try {
      final allDetailResults = await Future.wait(
        _pokemonList!.map((pokemon) async {
          final detailEither = await _getPokemonDetails.execute(pokemon.url);
          return detailEither;
        }).toList(),
      );

      final List<PokemonDetails> tempDetailedList = [];

      for (final eitherResult in allDetailResults) {
        eitherResult.when(
          (successDetail) {
            tempDetailedList.add(successDetail);
          },
          (failure) {
            print("Error al obtener detalles de un Pokémon: $failure");
          },
        );
      }

      _detailedPokemonList = tempDetailedList;

      emit(
        GetPokemonLoaded(
          pokemonList: _pokemonList ?? [],
          pokemonDetail: _detailedPokemonList,
        ),
      );
    } catch (e) {
      emit(DrSearchError('${AppDictionary.genericError}: $e'));
    }
  }
}
