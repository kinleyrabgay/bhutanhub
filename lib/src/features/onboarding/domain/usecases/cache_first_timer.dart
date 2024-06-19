import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/onboarding/domain/repos/onboarding.repo.dart';

class CacheFirstTimer extends UsecaseWithoutParam<void> {
  const CacheFirstTimer(this._repo);

  final OnboardingRepository _repo;

  @override
  ResultFuture call() async => _repo.cacheFirstTimer();
}
