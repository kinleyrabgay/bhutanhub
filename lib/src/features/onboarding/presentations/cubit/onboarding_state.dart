part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

// Caching
class CachingFirstTimer extends OnboardingState {
  const CachingFirstTimer();
}

// Check FirstTimer
class CheckingIfUserIsFirstTimer extends OnboardingState {
  const CheckingIfUserIsFirstTimer();
}

// User Cached
class UserCached extends OnboardingState {
  const UserCached();
}

// Status
class OnboardingStatus extends OnboardingState {
  const OnboardingStatus({required this.isFirstTimer});
  final bool isFirstTimer;

  @override
  List<bool> get props => [isFirstTimer];
}

// Error
class OnboardingError extends OnboardingState {
  const OnboardingError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class OnboardingPageChanged extends OnboardingState {
  final int index;

  const OnboardingPageChanged({
    this.index = 0,
  });

  @override
  List<Object> get props => [index];
}
