part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.entity, this.exception});
  final UserEntity? entity;
  final String? exception;

  @override
  List<Object> get props => [entity!, exception!];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthDone extends AuthState {
  // burada userentity verilecek
  const AuthDone(UserEntity? entity) : super(entity: entity);
}

class AuthError extends AuthState {
  const AuthError(String? exception) : super(exception: exception);
}
