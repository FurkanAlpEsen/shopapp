import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthBloc(super.initialState, this._loginUseCase, this._registerUseCase) {
    on<LoginEvent>(onLogin);
    on<RegisterEvent>(onRegister);
  }

  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    final dataState = await _loginUseCase.execute(event.entity);

    if (dataState.exception == null) {
      emit(AuthDone(event.entity));
    } else {
      emit(AuthError(dataState.exception!));
    }

    // if (dataState is DataFailed) {
    //   print('dogru yer bura');
    //   emit(AuthError(dataState.exception!));
    //   print('emit etti');
    // }
    // if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
    //   print('yanlis yer bura');

    //   emit(AuthDone(event.entity));
    // }
  }

  void onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    final dataState = await _registerUseCase.execute(event.entity);

    if (dataState.exception == null) {
      emit(AuthDone(event.entity));
    } else {
      emit(AuthError(dataState.exception!));
    }

    // if (dataState is DataSuccess) {
    //   emit(AuthDone(event.entity));
    // }
    // if (dataState is DataFailed) {
    //   emit(AuthError(dataState.exception!));
    // }
  }
}
