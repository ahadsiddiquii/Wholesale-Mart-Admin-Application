import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../user.dart';
import '../user_resources/user_repository.dart';

part 'all_users_event.dart';
part 'all_users_state.dart';

class AllUsersBloc extends Bloc<AllUsersEvent, AllUsersState> {
  AllUsersBloc() : super(AllUsersInitial()) {
    final UserRepository userRepository = UserRepository();
    on<ResetAllUsersStateToInitial>(
      (event, emit) async {
        emit(
          AllUsersInitial(),
        );
      },
    );

    on<FetchAllUsers>(
      (event, emit) async {
        try {
          emit(
            AllUsersLoading(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: true,
            loaderKeyForBloc: 'fetchAllUsers',
          );
          final List<User> allUsersRetrieved =
              await userRepository.getAllUsers();

          emit(
            AllUsersRetrieved(
              allUsers: allUsersRetrieved,
            ),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllUsers',
          );
        } catch (e) {
          emit(
            AllUsersInitial(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllUsers',
          );
        }
      },
    );

    on<RefreshAllUsers>((event, emit) async {
      try {
        final List<User> allUsersRetrieved = await userRepository.getAllUsers();
        emit(
          AllUsersRetrieved(
            allUsers: allUsersRetrieved,
          ),
        );
      } catch (e) {
        emit(
          AllUsersRetrieved(
            allUsers: event.previousUsers,
          ),
        );
      }
    });
  }
}
