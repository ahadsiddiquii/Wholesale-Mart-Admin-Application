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
    // on<CheckIfLoggedIn>((event, emit) async {
    //   try {
    //     if (event.isUserLoggedIn) {
    //       emit(
    //         CheckIfLoggedInLoading(),
    //       );
    //       LoaderService.setContextSafeLoader(
    //         startLoader: true,
    //         loaderKeyForBloc: 'checkingIfLoggedInUser',
    //       );

    //       final Map<String, dynamic> signInDetails =
    //           await userRepository.accountSignIn(
    //         userName: event.userName!,
    //         password: event.password!,
    //       );
    //       final User? currentUser;
    //       if (signInDetails['isAccountSigninSuccessful'] &&
    //           signInDetails['user'] != 'Unknown') {
    //         currentUser = signInDetails['user'];
    //         if (currentUser != null) {
    //           if (currentUser.userStores.length > 1) {
    //             emit(
    //               StoreSelection(
    //                 user: currentUser,
    //               ),
    //             );
    //           } else if (currentUser.userStores.length == 1) {
    //             currentUser.selectedStore = currentUser.userStores[0];
    //             Authentication.setStoreId(
    //               currentUser.selectedStore!.storeId,
    //             );
    //             UserAccessService.initializeAccessCriteria(
    //               userAccesses: currentUser.selectedStore!.userAccess,
    //             );
    //             emit(
    //               UserLoggedIn(
    //                 user: currentUser,
    //               ),
    //             );
    //           } else {
    //             throw Exception('No user stores found');
    //           }

    //           LoaderService.setContextSafeLoader(
    //             startLoader: false,
    //             loaderKeyForBloc: 'checkingIfLoggedInUser',
    //           );
    //         } else {
    //           throw Exception(
    //             'Error: Could not fetch user details',
    //           );
    //         }
    //       }
    //     } else {
    //       emit(
    //         UserInitial(),
    //       );
    //       LoaderService.setContextSafeLoader(
    //         startLoader: false,
    //         loaderKeyForBloc: 'checkingIfLoggedInUser',
    //       );
    //     }
    //   } catch (e) {
    //     emit(
    //       UserInitial(),
    //     );
    //     LoaderService.setContextSafeLoader(
    //       startLoader: false,
    //       loaderKeyForBloc: 'checkingIfLoggedInUser',
    //     );
    //   }
    // });

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
