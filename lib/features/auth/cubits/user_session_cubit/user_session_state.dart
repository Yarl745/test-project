part of 'user_session_cubit.dart';

abstract class UserSessionState extends Equatable {
  const UserSessionState();

  @override
  List<Object> get props => [];
}

class UserSessionInitial extends UserSessionState {}

class UserAuthorized extends UserSessionState {
  @override
  List<Object> get props => [DateTime.now()];
}

class UserNotAuthorized extends UserSessionState {}
