import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../vendor.dart';
import '../vendor_resources/vendor_repository.dart';

part 'all_vendors_event.dart';
part 'all_vendors_state.dart';

class AllVendorsBloc extends Bloc<AllVendorsEvent, AllVendorsState> {
  AllVendorsBloc() : super(AllVendorsInitial()) {
    final VendorRepository vendorRepository = VendorRepository();
    on<ResetAllVendorsStateToInitial>(
      (event, emit) async {
        emit(
          AllVendorsInitial(),
        );
      },
    );

    on<FetchAllVendors>(
      (event, emit) async {
        try {
          emit(
            AllVendorsLoading(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: true,
            loaderKeyForBloc: 'fetchAllVendors',
          );
          final List<Vendor> allVendorsRetrieved =
              await vendorRepository.getAllVendors();

          emit(
            AllVendorsRetrieved(
              allVendors: allVendorsRetrieved,
            ),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllVendors',
          );
        } catch (e) {
          emit(
            AllVendorsInitial(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllVendors',
          );
        }
      },
    );

    on<RefreshAllVendors>((event, emit) async {
      try {
        final List<Vendor> allVendorsRetrieved =
            await vendorRepository.getAllVendors();
        emit(
          AllVendorsRetrieved(
            allVendors: allVendorsRetrieved,
          ),
        );
      } catch (e) {
        emit(
          AllVendorsRetrieved(
            allVendors: event.previousVendors,
          ),
        );
      }
    });
  }
}
