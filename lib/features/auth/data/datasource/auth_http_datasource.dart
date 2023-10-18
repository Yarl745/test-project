import 'package:dio/dio.dart';
import 'package:olearistest/features/auth/data/models/login_input_data_model.dart';
import 'package:olearistest/features/auth/data/repositories/entities/login_input_data.dart';

abstract class AuthHttpDatasource {
  const AuthHttpDatasource();

  Future<String> loginUser(LoginInputData loginInput);
}

class AuthHttpDatasourceImpl extends AuthHttpDatasource {
  const AuthHttpDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<String> loginUser(LoginInputData loginInput) async {
    final json = LoginInputDataModel.toJson(loginInput);
    await Future.delayed(const Duration(seconds: 2));
    return 'test-token';
  }
}
