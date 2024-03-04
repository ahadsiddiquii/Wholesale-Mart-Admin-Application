import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_config.dart';
import '../../../../generic/apis/base_client.dart';
import '../category.dart';

class CategoryProvider {
  final String baseServerUrl = AppConfig.getApiUrl();
  final String tableName = 'category/';

  Future<List<Category>> getCategories() async {
    final String apiUrl = '$baseServerUrl$tableName';
    List<Category> categoriesList = [];
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.get,
      onError: (e) {
        debugPrint(e.toString());
      },
      onSuccess: (Response response) {
        try {
          //ignore: prefer_final_locals
          List<Category> fetchedCategories = [];
          for (final singleCategory in response.data['data']) {
            try {
              fetchedCategories.add(
                Category.fromJson(
                  singleCategory,
                ),
              );
            } catch (e) {
              debugPrint(
                'Found Some problem in a category: $e',
              );
            }
          }
          categoriesList = fetchedCategories;
        } catch (e) {
          debugPrint(
            'CategoryProvider: getCategories(GetCategoryList), Error in performing onSuccessFunction: $e',
          );
        }
      },
    );
    return categoriesList;
  }
}
