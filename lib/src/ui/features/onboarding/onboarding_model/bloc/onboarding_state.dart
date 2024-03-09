part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

class UserInitial extends OnboardingState {}

class UserSignInLoading extends OnboardingState {}

class CheckIfLoggedInLoading extends OnboardingState {}

class UserLoggedIn extends OnboardingState {
  UserLoggedIn({
    required this.user,
  });
  final User user;
}
