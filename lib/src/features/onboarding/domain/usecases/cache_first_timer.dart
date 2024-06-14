import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/onboarding/domain/repos/onboarding.repo.dart';

class CacheFirstTimer extends UsecaseWithoutParam<void> {
  const CacheFirstTimer(this._repo);

  final OnboardingRepository _repo;

  @override
  ResultFuture call() async => _repo.cacheFirstTimer();
}
