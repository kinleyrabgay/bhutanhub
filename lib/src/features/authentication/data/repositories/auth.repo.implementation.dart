import 'package:bhutan_hub/core/constants/enums.dart';
import 'package:bhutan_hub/core/errors/exception.dart';
import 'package:bhutan_hub/core/errors/failure.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/data/datasources/remote.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    try {
      await _remoteDataSource.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> getUser() async {
    try {
      final user = await _remoteDataSource.getUser();
      return Right(user);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  ResultFuture<User> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> register({
    required String email,
    required String fullName,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> updateUser(
      {required UpdateUserAction action, required userData}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  ResultVoid googleSSO() async {
    try {
      await _remoteDataSource.googleSSO();
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
