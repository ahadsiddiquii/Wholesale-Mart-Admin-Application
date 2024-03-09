import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../../../../generic/helper_functions/response_popup_service.dart';
import '../user_resources/user_repository.dart';

part 'user_cud_event.dart';
part 'user_cud_state.dart';

class UserCudBloc extends Bloc<UserCudEvent, UserCudState> {
  UserCudBloc() : super(UserCudInitial()) {
    final UserRepository userRepository = UserRepository();
    on<AddUser>((event, emit) async {
      try {
        emit(
          UserCudAdding(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'userCudAdding',
        );
        final bool userAdded = await userRepository.addUser(
          userName: event.userName,
          userEmailOrPhone: event.userEmailOrPhone,
          userPassword: event.userPassword,
          roles: event.roles,
        );
        if (userAdded) {
          emit(
            UserCudAdded(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'userCudAdding',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'User Added',
            message: 'Successfully added user.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          UserCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'userCudAdding',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot add user, please try again.',
        );
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        emit(
          UserCudDeleting(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'userCudDeleting',
        );
        final bool userDeleted = await userRepository.deleteUser(
          userId: event.userId,
        );
        if (userDeleted) {
          emit(
            UserCudDeleted(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'userCudDeleting',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'User Deleted',
            message: 'Successfully deleted user.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          UserCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'userCudDeleting',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot delete user, please try again.',
        );
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        emit(
          UserCudUpdating(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'userCudUpdating',
        );
        final bool categoryUpdated = await userRepository.updateUser(
          userId: event.userId,
          userName: event.userName,
          userEmailOrPhone: event.userEmailOrPhone,
          roles: event.roles,
        );
        if (categoryUpdated) {
          emit(
            UserCudUpdated(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'userCudUpdating',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'User Updated',
            message: 'Successfully updated user.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          UserCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'userCudUpdating',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot update user, please try again.',
        );
      }
    });
  }
}
