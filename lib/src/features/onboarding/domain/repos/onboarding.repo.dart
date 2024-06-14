import 'package:bhutan_hub/core/utils/typedef.dart';

abstract class OnboardingRepository {
  const OnboardingRepository();

  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkIfUserIsFirstTimer();
}
