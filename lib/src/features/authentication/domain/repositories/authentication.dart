import 'package:bhutan_hub/core/constants/enums.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid googleSSO();

  ResultFuture<User> getUser();

  ResultFuture<User> login({
    required String email,
    required String password,
  });

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
