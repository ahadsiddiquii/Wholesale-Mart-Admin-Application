import 'dart:convert';

import '../../../generic/apis/data_validator.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.categoryId,
    required this.categoryName,
    required this.pictureUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: DataValidator.validateData(json['id'], int),
        categoryName: DataValidator.validateData(json['categoryName'], String),
        pictureUrl: DataValidator.validateData(json['categoryImage'], String),
      );
  int categoryId;
  String categoryName;
  String pictureUrl;

  Map<String, dynamic> toJson() => {
        'id': categoryId,
        'categoryName': categoryName,
        'categoryImage': pictureUrl,
      };
}
