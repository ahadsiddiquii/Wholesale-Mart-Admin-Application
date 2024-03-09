import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_config.dart';
import '../../../../generic/apis/base_client.dart';
import '../user.dart';

class UserProvider {
  final String baseServerUrl = AppConfig.getApiUrl();
  final String tableName = 'user/';

  //Login User
  Future<User?> loginUser({
    required String userName,
    required String password,
  }) async {
    final String apiUrl = '$baseServerUrl${tableName}login';
    User? loginUser;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.post,
      data: {
        'userEmailOrPhone': userName,
        'password': password,
        'roles': ['admin'],
      },
      onError: (e) {
        debugPrint(e.toString());
      },
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            loginUser = User.fromJson(response.data['data']);
          }
        } catch (e) {
          debugPrint(
            'UserProvider: loginUser, Error in performing onSuccessFunction: $e',
          );
        }
      },
    );
    return loginUser;
  }

  //Get All Users
  Future<List<User>> getAllUsers() async {
    final String apiUrl = '$baseServerUrl$tableName';
    List<User> userList = [];
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.get,
      onError: (e) {
        debugPrint(e.toString());
      },
      onSuccess: (Response response) {
        try {
          final List<User> fetchedUsers = [];
          for (final singleUser in response.data['data']) {
            try {
              fetchedUsers.add(
                User.fromJson(
                  singleUser,
                ),
              );
            } catch (e) {
              debugPrint(
                'Found Some problem in a user: $e',
              );
            }
          }
          userList = fetchedUsers;
        } catch (e) {
          debugPrint(
            'UserProvider: getUsers(getAllUsers), Error in performing onSuccessFunction: $e',
          );
        }
      },
    );
    return userList;
  }

  //Add User
  Future<bool> addUser(
    String userName,
    String userEmailOrPhone,
    String userPassword,
    List<String> roles,
  ) async {
    final String apiUrl = '$baseServerUrl${tableName}signup';
    bool userAdded = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.post,
      data: {
        'userName': userName,
        'userEmailOrPhone': userEmailOrPhone,
        'password': userPassword,
        'roles': roles,
      },
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            userAdded = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'UserProvider: addUser, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return userAdded;
  }

  //Update User
  Future<bool> updateUser({
    required int userId,
    String? userName,
    String? userEmailOrPhone,
    List<String>? roles,
  }) async {
    final String apiUrl = '$baseServerUrl$tableName$userId';
    bool userUpdated = false;
    final Map<String, dynamic> requestData = {};
    if (userName != null) {
      requestData['userName'] = userName;
    }
    if (userEmailOrPhone != null) {
      requestData['userEmailOrPhone'] = userEmailOrPhone;
    }
    if (roles != null) {
      requestData['roles'] = roles;
    }
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.put,
      data: requestData,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            userUpdated = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'UserProvider: updateUser, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return userUpdated;
  }

  //Delete User
  Future<bool> deleteUser(int userId) async {
    final String apiUrl = '$baseServerUrl$tableName$userId';
    bool userDeleted = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.delete,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            userDeleted = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'UserProvider: deleteUser, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return userDeleted;
  }
}
