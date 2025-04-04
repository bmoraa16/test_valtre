import 'package:flutter_test_project/core/error.dart';
import 'package:flutter_test_project/features/home/data/datasources/pokemon_list_datasource.dart';
import 'package:flutter_test_project/features/home/data/mapper/mapper_domain.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_response.dart';
import 'package:flutter_test_project/features/home/domain/repositories/pokemon_list_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@Injectable(as: PokemonListRepository)
class PokemonListRepositoryImpl implements PokemonListRepository {
  final PokemonListDataSource _pokemonListDataSource;

  PokemonListRepositoryImpl(this._pokemonListDataSource);

  @override
  Future<Result<PokemonResponse, NetworkError>> getPokemonList() async {
    final result = await _pokemonListDataSource.getPokemonList();
    if (result.isSuccess()) {
      return Result.success(result.getOrThrow().toDomain);
    }

    return Result.error(result.tryGetError()!);
  }

  @override
  Future<Result<PokemonResponse, NetworkError>> loadMorePokemonList({
    required String nextUrl,
  }) async {
    final result = await _pokemonListDataSource.loadMorePokemonList(
      nextUrl: nextUrl,
    );
    if (result.isSuccess()) {
      return Result.success(result.getOrThrow().toDomain);
    }

    return Result.error(result.tryGetError()!);
  }

  @override
  Future<Result<PokemonDetails, NetworkError>> getPokemonDetails({
    required String pokemonIndex,
  }) async {
    final result = await _pokemonListDataSource.getPokemonDetails(
      pokemonIndex: pokemonIndex,
    );
    if (result.isSuccess()) {
      return Result.success(result.getOrThrow().toDomain);
    }

    return Result.error(result.tryGetError()!);
  }
}
