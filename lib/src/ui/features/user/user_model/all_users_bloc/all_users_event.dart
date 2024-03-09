part of 'all_users_bloc.dart';

@immutable
sealed class AllUsersEvent {}

class ResetAllUsersStateToInitial extends AllUsersEvent {}

class FetchAllUsers extends AllUsersEvent {}

class RefreshAllUsers extends AllUsersEvent {
  RefreshAllUsers({
    required this.previousUsers,
  });
  final List<User> previousUsers;
}
