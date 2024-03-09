import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../../../../generic/helper_functions/response_popup_service.dart';
import '../vendor_resources/vendor_repository.dart';

part 'vendor_cud_event.dart';
part 'vendor_cud_state.dart';

class VendorCudBloc extends Bloc<VendorCudEvent, VendorCudState> {
  VendorCudBloc() : super(VendorCudInitial()) {
    final VendorRepository vendorRepository = VendorRepository();
    on<AddVendor>((event, emit) async {
      try {
        emit(
          VendorCudAdding(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'vendorCudAdding',
        );
        final bool userAdded = await vendorRepository.addVendor(
          userId: event.userId,
          storeName: event.storeName,
          storeImage: event.storeImage,
          storeDescription: event.storeDescription,
          storePhone: event.storePhone,
          storeEmail: event.storeEmail,
        );
        if (userAdded) {
          emit(
            VendorCudAdded(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'vendorCudAdding',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Vendor Added',
            message: 'Successfully added vendor.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          VendorCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'vendorCudAdding',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot add vendor, please try again.',
        );
      }
    });

    on<DeleteVendor>((event, emit) async {
      try {
        emit(
          VendorCudDeleting(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'vendorCudDeleting',
        );
        final bool vendorDeleted = await vendorRepository.deleteVendor(
          vendorId: event.vendorId,
        );
        if (vendorDeleted) {
          emit(
            VendorCudDeleted(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'vendorCudDeleting',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Vendor Deleted',
            message: 'Successfully deleted vendor.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          VendorCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'vendorCudDeleting',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot delete vendor, please try again.',
        );
      }
    });

    on<UpdateVendor>((event, emit) async {
      try {
        emit(
          VendorCudUpdating(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'vendorCudUpdating',
        );
        final bool vendorUpdated = await vendorRepository.updateVendor(
          vendorId: event.vendorId,
          storeName: event.storeName,
          storeImage: event.storeImage,
          storeDescription: event.storeDescription,
          storePhone: event.storePhone,
          storeEmail: event.storeEmail,
        );
        if (vendorUpdated) {
          emit(
            VendorCudUpdated(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'vendorCudUpdating',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Vendor Updated',
            message: 'Successfully updated vendor.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          VendorCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'vendorCudUpdating',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot update vendor, please try again.',
        );
      }
    });
  }
}
