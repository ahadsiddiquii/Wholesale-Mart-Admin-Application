part of 'all_vendors_bloc.dart';

@immutable
sealed class AllVendorsEvent {}

class ResetAllVendorsStateToInitial extends AllVendorsEvent {}

class FetchAllVendors extends AllVendorsEvent {}

class RefreshAllVendors extends AllVendorsEvent {
  RefreshAllVendors({
    required this.previousVendors,
  });
  final List<Vendor> previousVendors;
}
