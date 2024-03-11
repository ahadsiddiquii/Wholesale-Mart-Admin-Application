import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../configs/router/routes.dart';
import '../../../../generic/context/app_context.dart';
import '../../../../generic/helper_functions/loader_service.dart';
import '../../../../generic/helper_functions/response_popup_service.dart';
import '../../../user/user_model/user.dart';
import '../../../user/user_view_model/user_service.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(UserInitial()) {
    final userRepository = UserService.requestUserRepository();
    on<CheckIfLoggedIn>((event, emit) async {
      try {
        emit(
          CheckIfLoggedInLoading(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'checkingIfLoggedInUser',
        );

        final User? userLoggedIn = await userRepository.loginUser(
          userName: event.userName,
          password: event.password,
        );
        final User? currentUser;
        if (userLoggedIn != null) {
          emit(
            UserLoggedIn(
              user: userLoggedIn,
            ),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'signingInUser',
          );
          appContext.runContextSafeFunction(() {
            Navigator.pushReplacementNamed(
              appContext.getContext()!,
              CustomRouter.homeScreenRouteName,
            );
          });
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          UserInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'checkingIfLoggedInUser',
        );
      }
    });

    on<SignInUser>((event, emit) async {
      try {
        emit(
          UserSignInLoading(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'signingInUser',
        );

        final User? userLoggedIn = await userRepository.loginUser(
          userName: event.userName,
          password: event.password,
        );
        if (userLoggedIn != null) {
          emit(
            UserLoggedIn(
              user: userLoggedIn,
            ),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'signingInUser',
          );
          appContext.runContextSafeFunction(() {
            Navigator.pushReplacementNamed(
              appContext.getContext()!,
              CustomRouter.homeScreenRouteName,
            );
          });
        } else {
          emit(
            UserInitial(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'signingInUser',
          );
          ResponsePopUpService.showVerificationFailedPopUp(
            message:
                'Incorrect email/phone or password, please enter valid credentials.',
          );
        }
      } catch (e) {
        emit(
          UserInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'signingInUser',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          message:
              'Incorrect email/phone or password, please enter valid credentials.',
        );
      }
    });
  }
}
