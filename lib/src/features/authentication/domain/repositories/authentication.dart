import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<UserEntity> googleSSO();

  ResultFuture<UserEntity> getUser();

  ResultFuture<UserEntity> login({
    required String email,
    required String password,
  });

  ResultFuture<void> logout();

  ResultFuture<void> register({
    required String name,
    required String email,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });

  ResultFuture<void> cacheCredentials({
    required String email,
    required String password,
  });
}
