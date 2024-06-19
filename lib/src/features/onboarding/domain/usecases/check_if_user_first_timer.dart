import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/onboarding/domain/repos/onboarding.repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParam<bool> {
  const CheckIfUserIsFirstTimer(this._repo);

  final OnboardingRepository _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkIfUserIsFirstTimer();
}
