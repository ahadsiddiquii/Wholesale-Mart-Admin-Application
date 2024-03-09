part of 'vendor_cud_bloc.dart';

@immutable
sealed class VendorCudState {}

final class VendorCudInitial extends VendorCudState {}

final class VendorCudAdding extends VendorCudState {}

final class VendorCudAdded extends VendorCudState {}

final class VendorCudDeleting extends VendorCudState {}

final class VendorCudDeleted extends VendorCudState {}

final class VendorCudUpdating extends VendorCudState {}

final class VendorCudUpdated extends VendorCudState {}
