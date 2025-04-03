// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart'
    as _i4;
import '../../features/home/data/datasources/pokemon_list_datasource.dart'
    as _i6;
import '../../features/home/data/datasources/pokemon_list_datasource_impl.dart'
    as _i7;
import '../../features/home/data/repositories/pokemon_list_repository_impl.dart'
    as _i9;
import '../../features/home/domain/repositories/pokemon_list_repository.dart'
    as _i8;
import '../../features/home/domain/usecases/get_pokemon_details_use_case.dart'
    as _i12;
import '../../features/home/domain/usecases/get_pokemon_list_use_case.dart'
    as _i10;
import '../../features/home/domain/usecases/load_more_pokemon_list_use_case.dart'
    as _i11;
import '../../features/home/presentation/bloc/get_pokemon_list_bloc.dart'
    as _i13;
import '../../features/splash/presentation/cubit/splash_cubit.dart' as _i5;
import '../managers/network_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NetworkManager>(() => _i3.NetworkManager());
    gh.singleton<_i4.DashboardNavigationCubit>(
        () => _i4.DashboardNavigationCubit());
    gh.lazySingleton<_i5.SplashCubit>(() => _i5.SplashCubit());
    gh.factory<_i6.PokemonListDataSource>(
        () => _i7.PokemonListDataSourceImpl(gh<_i3.NetworkManager>()));
    gh.factory<_i8.PokemonListRepository>(
        () => _i9.PokemonListRepositoryImpl(gh<_i6.PokemonListDataSource>()));
    gh.lazySingleton<_i10.GetPokemonListTokenUseCase>(
        () => _i10.GetPokemonListTokenUseCase(gh<_i8.PokemonListRepository>()));
    gh.lazySingleton<_i11.LoadMorePokemonListTokenUseCase>(() =>
        _i11.LoadMorePokemonListTokenUseCase(gh<_i8.PokemonListRepository>()));
    gh.lazySingleton<_i12.GetPokemonDetailsUseCase>(
        () => _i12.GetPokemonDetailsUseCase(gh<_i8.PokemonListRepository>()));
    gh.singleton<_i13.DrSearchBloc>(() => _i13.DrSearchBloc(
          gh<_i10.GetPokemonListTokenUseCase>(),
          gh<_i12.GetPokemonDetailsUseCase>(),
          gh<_i11.LoadMorePokemonListTokenUseCase>(),
        ));
    return this;
  }
}
