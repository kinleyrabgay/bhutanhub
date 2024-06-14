import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/onboarding/domain/repos/onboarding.repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParam<bool> {
  const CheckIfUserIsFirstTimer(this._repo);

  final OnboardingRepository _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkIfUserIsFirstTimer();
}
