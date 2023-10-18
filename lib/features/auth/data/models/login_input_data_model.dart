import 'package:olearistest/features/auth/data/repositories/entities/login_input_data.dart';

enum EmailLoginStatus {
  shortEmail,
  correctEmail,
}

enum PasswordLoginStatus {
  shortPassword,
  correctPassword,
}

class LoginInputDataModel {
  const LoginInputDataModel({required this.email, required this.password});

  final String email;
  final String password;

  static Map<String, dynamic> toJson(LoginInputData entity) {
    return {
      'email': entity.email,
      'password': entity.password,
    };
  }

  factory LoginInputDataModel.fromJson(Map<String, dynamic> json) {
    return LoginInputDataModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
