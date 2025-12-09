// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:luttrell/app/data/datasource/local/authentication_local_datasource.dart'
    as _i418;
import 'package:luttrell/app/data/datasource/remote/authentication_datasource.dart'
    as _i357;
import 'package:luttrell/app/data/repositories/authentication_repository.dart'
    as _i1043;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1043.AuthenticationRepository>(
      () => _i1043.AuthenticationRepositoryImpl(),
    );
    gh.factory<_i418.AuthenticationLocalDatasource>(
      () => _i418.AuthenticationLocalDatasourceDefault(),
    );
    gh.factory<_i357.AuthenticationDataSource>(
      () => _i357.AuthenticationDataSourceImpl(),
    );
    return this;
  }
}
