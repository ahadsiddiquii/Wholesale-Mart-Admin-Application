import '../vendor.dart';
import 'vendor_provider.dart';

class VendorRepository {
  final VendorProvider _vendorProvider = VendorProvider();

  Future<List<Vendor>> getAllVendors() => _vendorProvider.getAllVendors();

  Future<bool> addVendor({
    required int userId,
    required String storeName,
    required String storeImage,
    required String storeDescription,
    required String storePhone,
    required String storeEmail,
  }) =>
      _vendorProvider.addVendor(
        userId: userId,
        storeName: storeName,
        storeImage: storeImage,
        storeDescription: storeDescription,
        storePhone: storePhone,
        storeEmail: storeEmail,
      );

  Future<bool> deleteVendor({
    required int vendorId,
  }) =>
      _vendorProvider.deleteVendor(
        vendorId,
      );

  Future<bool> updateVendor({
    required int vendorId,
    String? storeName,
    String? storeImage,
    String? storeDescription,
    String? storePhone,
    String? storeEmail,
  }) =>
      _vendorProvider.updateVendor(
        vendorId: vendorId,
        storeName: storeName,
        storeImage: storeImage,
        storeDescription: storeDescription,
        storePhone: storePhone,
        storeEmail: storeEmail,
      );
}
