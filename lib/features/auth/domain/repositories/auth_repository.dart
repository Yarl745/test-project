import 'package:dartz/dartz.dart';
import 'package:olearistest/core/helper/type_aliases.dart';
import 'package:olearistest/features/auth/data/repositories/entities/login_input_data.dart';

abstract class AuthRepository {
  FutureFailable<String> loginToApp(LoginInputData loginInput);
  FutureFailable<Unit> saveJwtToken(String jwtToken);
}
