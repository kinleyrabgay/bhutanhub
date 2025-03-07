import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/failure.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/data/datasources/local.dart';
import 'package:bhutanhub/src/features/authentication/data/datasources/remote.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';
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
  ResultFuture<UserEntity> googleSSO() async {
    try {
      final model = await remoteDataSource.googleSSO();
      final entity = UserEntity(
        token: model.token,
        name: model.name,
        email: model.email,
        avatar: model.avatar,
        ratings: model.ratings,
        contact: model.contact,
        bio: model.bio,
      );
      return Right(entity);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(
        email: email,
        password: password,
      );
      final entity = UserEntity(
        token: model.token,
        name: model.name,
        email: model.email,
        avatar: model.avatar,
        ratings: model.ratings,
        contact: model.contact,
        bio: model.bio,
      );
      return Right(entity);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
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

  @override
  ResultFuture<UserEntity> getCurrentUser() async {
    try {
      final model = await remoteDataSource.getCurrentUser();
      final entity = UserEntity(
        token: model.token,
        name: model.name,
        email: model.email,
        avatar: model.avatar,
        ratings: model.ratings,
        contact: model.contact,
        bio: model.bio,
      );
      return Right(entity);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
