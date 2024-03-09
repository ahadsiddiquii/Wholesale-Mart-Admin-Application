part of 'vendor_cud_bloc.dart';

@immutable
sealed class VendorCudEvent {}

class AddVendor extends VendorCudEvent {
  AddVendor({
    required this.userId,
    required this.storeName,
    required this.storeImage,
    required this.storeDescription,
    required this.storePhone,
    required this.storeEmail,
  });
  final int userId;
  final String storeName, storeImage, storeDescription, storePhone, storeEmail;
}

class DeleteVendor extends VendorCudEvent {
  DeleteVendor({
    required this.vendorId,
  });
  final int vendorId;
}

class UpdateVendor extends VendorCudEvent {
  UpdateVendor({
    required this.vendorId,
    this.storeName,
    this.storeImage,
    this.storeDescription,
    this.storePhone,
    this.storeEmail,
  });
  final int vendorId;
  final String? storeName;
  final String? storeImage;
  final String? storeDescription;
  final String? storePhone;
  final String? storeEmail;
}
