part of 'all_users_bloc.dart';

@immutable
sealed class AllUsersState {}

final class AllUsersInitial extends AllUsersState {}

final class AllUsersLoading extends AllUsersState {}

final class AllUsersRetrieved extends AllUsersState {
  AllUsersRetrieved({
    required this.allUsers,
  });
  final List<User> allUsers;
}
