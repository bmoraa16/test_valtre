import 'package:flutter_test_project/core/constants/urls.dart';
import 'package:flutter_test_project/features/home/data/datasources/pokemon_list_datasource.dart';
import 'package:flutter_test_project/features/home/data/models/pokemon_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error.dart';
import '../../../../core/managers/network_manager.dart';

@Injectable(as: PokemonListDataSource)
class PokemonListDataSourceImpl implements PokemonListDataSource {
  final NetworkManager _networkManager;

  PokemonListDataSourceImpl(this._networkManager);

  @override
  Future<Result<PokemonResponseDto, NetworkError>> getPokemonList() async {
    final request = Request(
      url: Urls.getPokemon,
      method: RequestType.get,
    );

    return await _networkManager.call<PokemonResponseDto>(
      mapper: PokemonResponseDto.fromJson,
      request: request,
    );
  }
}
