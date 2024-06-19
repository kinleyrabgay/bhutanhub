import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/failure.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/onboarding/data/datasource/local.source.dart';
import 'package:bhutanhub/src/features/onboarding/domain/repos/onboarding.repo.dart';
import 'package:dartz/dartz.dart';

class OnboardingRepoImplementation extends OnboardingRepository {
  const OnboardingRepoImplementation(this._localDataSource);

  final OnboardingLocalDatasource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
