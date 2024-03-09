import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_model/all_users_bloc/all_users_bloc.dart';
import '../user_model/user_cud_bloc/user_cud_bloc.dart';
import '../user_model/user_resources/user_repository.dart';

class UserService {
  UserService._();

  static UserRepository requestUserRepository() {
    return UserRepository();
  }

  //Bloc Calling
  //All Users Bloc
  static void getAllUsers(BuildContext context) {
    final allUsersBlocState = BlocProvider.of<AllUsersBloc>(context).state;

    if (allUsersBlocState is AllUsersRetrieved) {
      BlocProvider.of<AllUsersBloc>(context).add(
        RefreshAllUsers(
          previousUsers: allUsersBlocState.allUsers,
        ),
      );
    } else {
      BlocProvider.of<AllUsersBloc>(context).add(
        FetchAllUsers(),
      );
    }
  }

  static void resetAllCategoriesBloc(BuildContext context) {
    BlocProvider.of<AllUsersBloc>(context).add(
      ResetAllUsersStateToInitial(),
    );
  }

  //Category CUD Bloc
  //Add User
  static void addUser(
    BuildContext context, {
    required String userName,
    required String userEmailOrPhone,
    required String userPassword,
    required List<String> roles,
  }) {
    BlocProvider.of<UserCudBloc>(context).add(
      AddUser(
        userName: userName,
        userEmailOrPhone: userEmailOrPhone,
        userPassword: userPassword,
        roles: roles,
      ),
    );
  }

  //Update User
  static void updateUser(
    BuildContext context, {
    required int userId,
    String? userName,
    String? userEmailOrPhone,
    List<String>? roles,
  }) {
    BlocProvider.of<UserCudBloc>(context).add(
      UpdateUser(
        userId: userId,
        userName: userName,
        userEmailOrPhone: userEmailOrPhone,
        roles: roles,
      ),
    );
  }

  //Delete User
  static void deleteUser(
    BuildContext context, {
    required int userId,
  }) {
    BlocProvider.of<UserCudBloc>(context).add(
      DeleteUser(
        userId: userId,
      ),
    );
  }
}
