import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olearistest/features/auth/data/repositories/entities/login_input_data.dart';
import 'package:olearistest/features/auth/domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitial());

  final AuthRepository _authRepository;

  void enterCredentials({String? email, String? password}) {
    final currentState = state;

    if (currentState is LoginCredentialsNotCorrect) {
      final loginInput = LoginInputData(
        email: email ?? currentState.loginInput.email,
        password: password ?? currentState.loginInput.password,
      );
      emit(
        loginInput.isAllCredentialsCorrect
            ? LoginCredentialsCorrect(loginInput: loginInput)
            : LoginCredentialsNotCorrect(
                emailLoginStatus: loginInput.checkEmail(),
                passwordLoginStatus: loginInput.checkPassword(),
                loginInput: loginInput,
              ),
      );
      return;
    } else if (currentState is LoginEnterCredentials) {
      final loginInput = LoginInputData(
        email: email ?? currentState.loginInput.email,
        password: password ?? currentState.loginInput.password,
      );

      emit(
        loginInput.isAllCredentialsCorrect
            ? LoginCredentialsCorrect(loginInput: loginInput)
            : LoginEnterCredentials(loginInput: loginInput),
      );
      return;
    }

    emit(
      LoginEnterCredentials(
        loginInput: LoginInputData(
          email: email ?? '',
          password: password ?? '',
        ),
      ),
    );
  }

  Future<String?> loginToApp() async {
    final currentState = state;

    if (currentState is LoginEnterCredentials) {
      if (currentState.loginInput.isAllCredentialsCorrect == false) {
        emit(
          LoginCredentialsNotCorrect(
            emailLoginStatus: currentState.loginInput.checkEmail(),
            passwordLoginStatus: currentState.loginInput.checkPassword(),
            loginInput: currentState.loginInput,
          ),
        );
        return null;
      }

      emit(LoginToAccountLoading(loginInput: currentState.loginInput));

      final authToken = (await _authRepository.loginToApp(currentState.loginInput)).fold(
        (failure) => null,
        (token) => token,
      );
      if (authToken == null) {
        emit(
          LoginCredentialsNotCorrect(
            emailLoginStatus: currentState.loginInput.checkEmail(),
            passwordLoginStatus: PasswordLoginStatus.notCorrectPassword,
            loginInput: currentState.loginInput,
          ),
        );
      } else {
        Future.delayed(const Duration(milliseconds: 500)).then(
          (value) => emit(LoginCredentialsCorrect(loginInput: currentState.loginInput)),
        );
      }
      return authToken;
    }
    return null;
  }
}
