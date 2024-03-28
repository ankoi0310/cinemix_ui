part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class CachingFirstTime extends OnboardingState {
  const CachingFirstTime();
}

class CheckingFirstTime extends OnboardingState {
  const CheckingFirstTime();
}

class FirstTimeCached extends OnboardingState {
  const FirstTimeCached();
}

class OnboardingStatus extends OnboardingState {
  const OnboardingStatus({required this.isFirstTime});

  final bool isFirstTime;

  @override
  List<bool> get props => [isFirstTime];
}

class OnboardingError extends OnboardingState {
  const OnboardingError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
