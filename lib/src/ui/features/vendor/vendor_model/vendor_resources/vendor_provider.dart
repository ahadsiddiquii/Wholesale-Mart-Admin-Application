import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_config.dart';
import '../../../../generic/apis/base_client.dart';
import '../vendor.dart';

class VendorProvider {
  final String baseServerUrl = AppConfig.getApiUrl();
  final String tableName = 'vendor/';

  //Get All Vendors
  Future<List<Vendor>> getAllVendors() async {
    final String apiUrl = '$baseServerUrl$tableName';
    List<Vendor> vendorList = [];
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.get,
      onError: (e) {
        debugPrint(e.toString());
      },
      onSuccess: (Response response) {
        try {
          final List<Vendor> fetchedVendors = [];
          for (final singleVendor in response.data['data']) {
            try {
              fetchedVendors.add(
                Vendor.fromJson(
                  singleVendor,
                ),
              );
            } catch (e) {
              debugPrint(
                'Found Some problem in a vendor: $e',
              );
            }
          }
          vendorList = fetchedVendors;
        } catch (e) {
          debugPrint(
            'VendorProvider: getVendors(getAllVendors), Error in performing onSuccessFunction: $e',
          );
        }
      },
    );
    return vendorList;
  }

  //Add Vendor
  Future<bool> addVendor({
    required int userId,
    required String storeName,
    required String storeImage,
    required String storeDescription,
    required String storePhone,
    required String storeEmail,
  }) async {
    final String apiUrl = '$baseServerUrl${tableName}add-store';
    bool vendorAdded = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.post,
      data: {
        'userId': userId,
        'storeName': storeName,
        'storeImage': storeImage,
        'storeDescription': storeDescription,
        'storePhone': storePhone,
        'storeEmail': storeEmail,
      },
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            vendorAdded = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'VendorProvider: addVendor, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return vendorAdded;
  }

  //Update Vendor
  Future<bool> updateVendor({
    required int vendorId,
    String? storeName,
    String? storeImage,
    String? storeDescription,
    String? storePhone,
    String? storeEmail,
  }) async {
    final String apiUrl = '$baseServerUrl$tableName$vendorId';
    bool vendorUpdated = false;
    final Map<String, dynamic> requestData = {};
    if (storeName != null) {
      requestData['storeName'] = storeName;
    }
    if (storeImage != null) {
      requestData['storeImage'] = storeImage;
    }
    if (storeDescription != null) {
      requestData['storeDescription'] = storeDescription;
    }
    if (storePhone != null) {
      requestData['storePhone'] = storePhone;
    }
    if (storeEmail != null) {
      requestData['storeEmail'] = storeEmail;
    }
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.put,
      data: requestData,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            vendorUpdated = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'VendorProvider: updateVendor, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return vendorUpdated;
  }

  //Delete Vendor
  Future<bool> deleteVendor(int vendorId) async {
    final String apiUrl = '$baseServerUrl$tableName$vendorId';
    bool vendorDeleted = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.delete,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            vendorDeleted = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'VendorProvider: deleteVendor, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return vendorDeleted;
  }
}
