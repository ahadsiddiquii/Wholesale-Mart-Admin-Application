import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onboarding_model/bloc/onboarding_bloc.dart';

class OnboardingService {
  OnboardingService._();

  //Login User
  static void loginUser(
    BuildContext context, {
    required String userName,
    required String userPassword,
  }) {
    BlocProvider.of<OnboardingBloc>(context).add(
      SignInUser(
        userName: userName,
        password: userPassword,
      ),
    );
  }
}
