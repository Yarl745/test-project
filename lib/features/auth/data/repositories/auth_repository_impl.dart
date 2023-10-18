import 'package:dartz/dartz.dart';
import 'package:olearistest/core/error/error_handler.dart';
import 'package:olearistest/core/error/failures.dart';
import 'package:olearistest/core/helper/type_aliases.dart';
import 'package:olearistest/features/auth/data/datasource/auth_cache_datasource.dart';
import 'package:olearistest/features/auth/data/datasource/auth_http_datasource.dart';
import 'package:olearistest/features/auth/data/repositories/entities/login_input_data.dart';
import 'package:olearistest/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthCacheDatasource authCacheDatasource,
    required AuthHttpDatasource authHttpDatasource,
  })  : _authHttpDatasource = authHttpDatasource,
        _authCacheDatasource = authCacheDatasource;

  final AuthCacheDatasource _authCacheDatasource;
  final AuthHttpDatasource _authHttpDatasource;

  @override
  FutureFailable<String> loginToApp(LoginInputData loginInput) async {
    try {
      final jwtToken = await _authHttpDatasource.loginUser(loginInput);
      return right(jwtToken);
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }

  @override
  FutureFailable<Unit> saveJwtToken(String jwtToken) async {
    try {
      await _authCacheDatasource.saveJwtToken(jwtToken);
      return right(unit);
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }
}
