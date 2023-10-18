part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginEnterCredentials extends LoginState {
  const LoginEnterCredentials({
    required this.loginInput,
  });

  final LoginInputData loginInput;

  @override
  List<Object> get props => [loginInput];
}

class LoginCredentialsCorrect extends LoginEnterCredentials {
  const LoginCredentialsCorrect({
    required super.loginInput,
  });
}

class LoginCredentialsNotCorrect extends LoginEnterCredentials {
  const LoginCredentialsNotCorrect({
    required this.emailLoginStatus,
    required this.passwordLoginStatus,
    required super.loginInput,
  });

  final EmailLoginStatus emailLoginStatus;
  final PasswordLoginStatus passwordLoginStatus;

  @override
  List<Object> get props => [loginInput, emailLoginStatus, passwordLoginStatus];
}

class LoginToAccountLoading extends LoginEnterCredentials {
  const LoginToAccountLoading({
    required super.loginInput,
  });
}
