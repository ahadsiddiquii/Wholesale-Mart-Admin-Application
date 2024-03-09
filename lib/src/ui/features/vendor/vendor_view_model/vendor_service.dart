import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vendor_model/all_vendors_bloc/all_vendors_bloc.dart';
import '../vendor_model/vendor_cud_bloc/vendor_cud_bloc.dart';

class VendorService {
  VendorService._();

  //Bloc Calling
  //All Vendors Bloc
  static void getAllVendors(BuildContext context) {
    final allVendorsBlocState = BlocProvider.of<AllVendorsBloc>(context).state;

    if (allVendorsBlocState is AllVendorsRetrieved) {
      BlocProvider.of<AllVendorsBloc>(context).add(
        RefreshAllVendors(
          previousVendors: allVendorsBlocState.allVendors,
        ),
      );
    } else {
      BlocProvider.of<AllVendorsBloc>(context).add(
        FetchAllVendors(),
      );
    }
  }

  static void resetAllCategoriesBloc(BuildContext context) {
    BlocProvider.of<AllVendorsBloc>(context).add(
      ResetAllVendorsStateToInitial(),
    );
  }

  //Category CUD Bloc
  //Add Vendor
  static void addVendor(
    BuildContext context, {
    required int userId,
    required String storeName,
    required String storeImage,
    required String storeDescription,
    required String storePhone,
    required String storeEmail,
  }) {
    BlocProvider.of<VendorCudBloc>(context).add(
      AddVendor(
        userId: userId,
        storeName: storeName,
        storeImage: storeImage,
        storeDescription: storeDescription,
        storePhone: storePhone,
        storeEmail: storeEmail,
      ),
    );
  }

  //Update Vendor
  static void updateVendor(
    BuildContext context, {
    required int vendorId,
    String? storeName,
    String? storeImage,
    String? storeDescription,
    String? storePhone,
    String? storeEmail,
  }) {
    BlocProvider.of<VendorCudBloc>(context).add(
      UpdateVendor(
        vendorId: vendorId,
        storeName: storeName,
        storeImage: storeImage,
        storeDescription: storeDescription,
        storePhone: storePhone,
        storeEmail: storeEmail,
      ),
    );
  }

  //Delete Vendor
  static void deleteVendor(
    BuildContext context, {
    required int vendorId,
  }) {
    BlocProvider.of<VendorCudBloc>(context).add(
      DeleteVendor(
        vendorId: vendorId,
      ),
    );
  }
}
