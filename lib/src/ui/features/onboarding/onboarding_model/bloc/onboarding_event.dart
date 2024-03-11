part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class CheckIfLoggedIn extends OnboardingEvent {
  CheckIfLoggedIn({
    required this.userName,
    required this.password,
  });
  final String userName;
  final String password;
}

class SignInUser extends OnboardingEvent {
  SignInUser({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;
}
