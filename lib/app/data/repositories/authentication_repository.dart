import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luttrell/app/data/datasource/local/authentication_local_datasource.dart';
import 'package:luttrell/app/data/datasource/remote/authentication_datasource.dart';
import 'package:luttrell/app/data/exception/exception.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../utils/http_utils.dart';
import '../models/models.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthenticationException, HttpResponse>> registerUser(
      Map<String, dynamic> userData);
  Future<Either<AuthenticationException, HttpResponse>> login(
      String username, String password);
  Future<Either<AuthenticationException, HttpResponse>> getUserProfileData();
  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRefreshToken(String accessToken);
  Future<String> getAccessToken();
  Future<String> getRefreshToken();
  Future<void> clearAuthSession();
  Future<void> logout();
}

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource =
      GetIt.I.get<AuthenticationDataSource>();
  final AuthenticationLocalDatasource _authenticationLocalDatasource =
      GetIt.I.get<AuthenticationLocalDatasource>();

  @override
  Future<Either<AuthenticationException, HttpResponse>> registerUser(
      Map<String, dynamic> userData) async {
    try {
      HttpResponse response =
          await _authenticationDataSource.registerUser(userData);

      return Right(response);
    } on DioException catch (e) {
      return Left(AuthenticationException(message: e.message ?? "Error"));
    }
  }

  @override
  Future<Either<AuthenticationException, HttpResponse>> login(
      String username, String password) async {
    try {
      HttpResponse response =
          await _authenticationDataSource.login(username, password);

      return Right(response);
    } on DioException catch (e) {
      return Left(AuthenticationException(message: e.message ?? "Error"));
    }
  }

  @override
  Future<Either<AuthenticationException, HttpResponse>>
      getUserProfileData() async {
    try {
      HttpResponse response =
          await _authenticationDataSource.getUserProfileData();

      return Right(response);
    } on DioException catch (e) {
      return Left(AuthenticationException(message: e.message ?? "Error"));
    }
  }

  @override
  Future<void> logout() async {
    await _authenticationLocalDatasource.clearAuthSession();
  }

  @override
  Future<void> saveUser(User user) async {
    await _authenticationLocalDatasource.saveUser(user);
  }

  @override
  Future<User?> getUser() async {
    return _authenticationLocalDatasource.getUser();
  }

  @override
  Future<String> getAccessToken() async {
    return _authenticationLocalDatasource.getAccessToken();
  }

  @override
  Future<String> getRefreshToken() async {
    return _authenticationLocalDatasource.getRefreshToken();
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _authenticationLocalDatasource.saveAccessToken(accessToken);
  }

  @override
  Future<void> saveRefreshToken(String accessToken) async {
    await _authenticationLocalDatasource.saveRefreshToken(accessToken);
  }

  @override
  Future<void> clearAuthSession() async {
    await _authenticationLocalDatasource.clearAuthSession();
  }
}
