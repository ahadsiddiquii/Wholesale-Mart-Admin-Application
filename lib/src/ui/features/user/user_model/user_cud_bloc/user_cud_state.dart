part of 'user_cud_bloc.dart';

@immutable
sealed class UserCudState {}

final class UserCudInitial extends UserCudState {}

final class UserCudAdding extends UserCudState {}

final class UserCudAdded extends UserCudState {}

final class UserCudDeleting extends UserCudState {}

final class UserCudDeleted extends UserCudState {}

final class UserCudUpdating extends UserCudState {}

final class UserCudUpdated extends UserCudState {}
