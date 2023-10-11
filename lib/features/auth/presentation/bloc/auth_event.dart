part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent(this.entity);

  final UserEntity entity;
  @override
  List<Object> get props => [entity];
}

class LoginEvent extends AuthEvent {
  const LoginEvent(UserEntity entity) : super(entity);
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent(UserEntity entity) : super(entity);
}
