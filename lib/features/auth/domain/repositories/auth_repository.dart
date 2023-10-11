import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<void>> login(UserEntity user);
  Future<DataState<void>> register(UserEntity user);
}
