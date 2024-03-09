import '../user.dart';
import 'user_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User?> loginUser({
    required String userName,
    required String password,
  }) =>
      _userProvider.loginUser(
        userName: userName,
        password: password,
      );

  Future<List<User>> getAllUsers() => _userProvider.getAllUsers();

  Future<bool> addUser({
    required String userName,
    required String userEmailOrPhone,
    required String userPassword,
    required List<String> roles,
  }) =>
      _userProvider.addUser(
        userName,
        userEmailOrPhone,
        userPassword,
        roles,
      );

  Future<bool> deleteUser({
    required int userId,
  }) =>
      _userProvider.deleteUser(
        userId,
      );

  Future<bool> updateUser({
    required int userId,
    String? userName,
    String? userEmailOrPhone,
    List<String>? roles,
  }) =>
      _userProvider.updateUser(
        userId: userId,
        userName: userName,
        userEmailOrPhone: userEmailOrPhone,
        roles: roles,
      );
}
