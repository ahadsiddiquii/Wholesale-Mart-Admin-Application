part of 'all_vendors_bloc.dart';

@immutable
sealed class AllVendorsState {}

final class AllVendorsInitial extends AllVendorsState {}

final class AllVendorsLoading extends AllVendorsState {}

final class AllVendorsRetrieved extends AllVendorsState {
  AllVendorsRetrieved({
    required this.allVendors,
  });
  final List<Vendor> allVendors;
}
