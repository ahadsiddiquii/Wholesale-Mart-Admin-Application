import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_config.dart';
import '../../../../generic/apis/base_client.dart';
import '../category.dart';

class CategoryProvider {
  final String baseServerUrl = AppConfig.getApiUrl();
  final String tableName = 'category/';

  //Get All Categories
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

  //Add Category
  Future<bool> addCategory(
    String categoryName,
    String categoryImage,
  ) async {
    final String apiUrl = '$baseServerUrl$tableName';
    bool categoryAdded = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.post,
      data: {
        'categoryName': categoryName,
        'categoryImage': categoryImage,
      },
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            categoryAdded = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'CategoryProvider: addCategory, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return categoryAdded;
  }

  //Delete Category
  Future<bool> deleteCategory(int categoryId) async {
    final String apiUrl = '$baseServerUrl$tableName$categoryId';
    bool categoryDeleted = false;
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.delete,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            categoryDeleted = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'CategoryProvider: deleteCategory, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return categoryDeleted;
  }

  //Update Category
  Future<bool> updateCategory(
    int categoryId,
    String? categoryName,
    String? categoryImage,
  ) async {
    final String apiUrl = '$baseServerUrl$tableName$categoryId';
    bool updatedCategory = false;
    final Map<String, dynamic> requestData = {};
    if (categoryName != null) {
      requestData['categoryName'] = categoryName;
    }
    if (categoryImage != null) {
      requestData['categoryImage'] = categoryImage;
    }
    await BaseClient.safeApiCall(
      apiUrl,
      RequestType.put,
      data: requestData,
      onError: (e) {},
      onSuccess: (Response response) {
        try {
          if (response.data['success']) {
            updatedCategory = true;
          } else {
            throw Exception();
          }
        } catch (e) {
          final String errorString =
              'CategoryProvider: updatedCategory, onSuccess caught: $e';
          debugPrint(
            errorString,
          );
          throw Exception(
            errorString,
          );
        }
      },
    );
    return updatedCategory;
  }
}
