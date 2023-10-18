import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olearistest/features/auth/domain/repositories/auth_repository.dart';

part 'user_session_state.dart';

class UserSessionCubit extends Cubit<UserSessionState> {
  UserSessionCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(UserSessionInitial());

  final AuthRepository _authRepository;

  void saveTokenAndAuthorize({required String token}) async {
    (await _authRepository.saveJwtToken(token)).fold(
      (failure) => null,
      (_) => emit(UserAuthorized()),
    );
  }

  bool isUserAuthorized() => state is UserAuthorized;
}
