import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  int? uid;
  String userName;
  String email;
  String password;

  UserEntity(
    this.uid,
    this.userName,
    this.email,
    this.password,
  );

  @override
  List<Object?> get props {
    return [uid, userName, email, password];
  }
}
