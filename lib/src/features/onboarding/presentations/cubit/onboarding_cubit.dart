import 'package:bhutanhub/src/features/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:bhutanhub/src/features/onboarding/domain/usecases/check_if_user_first_timer.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
    required CacheFirstTimer cacheFirstTimer,
  })  : _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        _cacheFirstTimer = cacheFirstTimer,
        super(
          const OnboardingInitial(),
        ) {
    _currentPageIndex = 0;
  }

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  final PageController pageController = PageController(initialPage: 0);
  late int _currentPageIndex;

  // Method to cache first timer
  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnboardingError(failure.message)),
      (_) => emit(const UserCached()),
    );
  }

  // Method to check if user is first timer
  Future<void> checkingIfUserIsFirstTimer() async {
    emit(const CheckingIfUserIsFirstTimer());
    final result = await _checkIfUserIsFirstTimer();

    result.fold(
      (failure) => emit(const OnboardingStatus(isFirstTimer: false)),
      (status) => emit(OnboardingStatus(isFirstTimer: status)),
    );
  }

  // Method to update page indicator
  void updatePageIndicator(int index) {
    _currentPageIndex = index;
  }

  // Method to handle dot navigation click
  void dotNavigationClick(int index) {
    pageController.jumpToPage(index);
    _currentPageIndex = index;
  }

  // Method to handle next page navigation
  void nextPage() {
    if (_currentPageIndex == 3) {
      cacheFirstTimer();
    } else {
      final nextPageIndex = _currentPageIndex + 1;
      pageController.jumpToPage(nextPageIndex);
      _currentPageIndex = nextPageIndex;
    }
  }

  // Method to skip to the last page
  void skipPage() {
    pageController.jumpToPage(3);
    _currentPageIndex = 3;
  }
}
