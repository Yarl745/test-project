import 'package:equatable/equatable.dart';
import 'package:olearistest/core/helper/string_ext.dart';

enum EmailLoginStatus {
  shortEmail,
  correctEmail,
}

enum PasswordLoginStatus {
  shortPassword,
  notCorrectPassword,
  correctPassword,
}

class LoginInputData extends Equatable {
  const LoginInputData({required this.email, required this.password});

  final String email;
  final String password;

  bool get isAllCredentialsCorrect =>
      checkEmail() == EmailLoginStatus.correctEmail && checkPassword() == PasswordLoginStatus.correctPassword;

  EmailLoginStatus checkEmail() {
    if (email.isEmailShort) {
      return EmailLoginStatus.shortEmail;
    } //
    else {
      return EmailLoginStatus.correctEmail;
    }
  }

  PasswordLoginStatus checkPassword() {
    if (password.isPasswordShort) {
      return PasswordLoginStatus.shortPassword;
    } //
    else {
      return PasswordLoginStatus.correctPassword;
    }
  }

  @override
  List<Object> get props => [email, password];
}
