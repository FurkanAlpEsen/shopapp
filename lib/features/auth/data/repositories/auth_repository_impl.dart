import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/auth/data/datasources/remote/login_service.dart';
import 'package:shopapp/features/auth/data/datasources/remote/register_service.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';
import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.loginService, this.registerService);

  final LoginService loginService;
  final RegisterService registerService;

  @override
  Future<DataState<void>> login(UserEntity user) async {
    try {
      var result = await loginService.login(user.userName, user.password);

      if (result.exception == null) {
        return DataSuccess(result);
      } else {
        return DataFailed(result.exception!);
      }
    } catch (e) {
      return DataFailed(e as String);
    }
  }

  @override
  Future<DataState<void>> register(UserEntity user) async {
    var result = await registerService.register(
        user.userName, user.email, user.password);
    if (result.exception == null) {
      return DataSuccess(result);
    } else {
      return DataFailed(result.exception!);
    }
  }
}
