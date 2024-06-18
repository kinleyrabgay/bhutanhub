import 'package:bhutan_hub/core/constants/enums.dart';
import 'package:bhutan_hub/core/errors/exception.dart';
import 'package:bhutan_hub/core/errors/failure.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/data/datasources/local.dart';
import 'package:bhutan_hub/src/features/authentication/data/datasources/remote.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final AuthRemoteDataSource remoteDataSource;
  final AutheLocalDataSource localDataSource;

  @override
  ResultFuture<User> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid googleSSO() async {
    try {
      await remoteDataSource.googleSSO();
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await remoteDataSource.forgotPassword(email);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required userData,
  }) async {
    try {
      await remoteDataSource.updateUser(action: action, userData: userData);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> cacheCredentials({
    required String email,
    required String password,
  }) async {
    try {
      await localDataSource.cacheCredentials(email: email, password: password);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
