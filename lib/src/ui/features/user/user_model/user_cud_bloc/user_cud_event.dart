part of 'user_cud_bloc.dart';

@immutable
sealed class UserCudEvent {}

class AddUser extends UserCudEvent {
  AddUser({
    required this.userName,
    required this.userEmailOrPhone,
    required this.userPassword,
    required this.roles,
  });
  final String userName, userEmailOrPhone, userPassword;
  final List<String> roles;
}

class DeleteUser extends UserCudEvent {
  DeleteUser({
    required this.userId,
  });
  final int userId;
}

class UpdateUser extends UserCudEvent {
  UpdateUser({
    required this.userId,
    this.userName,
    this.userEmailOrPhone,
    this.roles,
  });
  final int userId;
  final String? userName;
  final String? userEmailOrPhone;
  final List<String>? roles;
}
