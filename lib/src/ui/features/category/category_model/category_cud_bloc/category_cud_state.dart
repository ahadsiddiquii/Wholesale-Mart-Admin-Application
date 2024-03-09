part of 'category_cud_bloc.dart';

@immutable
sealed class CategoryCudState {}

final class CategoryCudInitial extends CategoryCudState {}

final class CategoryCudAdding extends CategoryCudState {}

final class CategoryCudAdded extends CategoryCudState {}

final class CategoryCudDeleting extends CategoryCudState {}

final class CategoryCudDeleted extends CategoryCudState {}

final class CategoryCudUpdating extends CategoryCudState {}

final class CategoryCudUpdated extends CategoryCudState {}
