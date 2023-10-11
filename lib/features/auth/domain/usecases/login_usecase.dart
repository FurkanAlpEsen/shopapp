import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';
import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  const LoginUseCase(this.authRepository);

  Future<DataState<void>> execute(UserEntity entity) async {
    final result = await authRepository.login(entity);

    if (result.exception == null) {
      return DataSuccess(result);
    } else {
      return DataFailed(result.exception!);
    }
  }
}
