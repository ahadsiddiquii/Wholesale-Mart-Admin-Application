import 'dart:convert';

import '../../../generic/apis/data_validator.dart';

class Vendor {
  Vendor({
    required this.id,
    required this.storeName,
    required this.storeImage,
    required this.storeDescription,
    required this.storePhone,
    required this.storeEmail,
  });

  factory Vendor.fromRawJson(String str) => Vendor.fromJson(json.decode(str));

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: DataValidator.validateData(json['id'], int),
        storeName: DataValidator.validateData(json['storeName'], String),
        storeImage: DataValidator.validateData(json['storeImage'], String),
        storeDescription:
            DataValidator.validateData(json['storeDescription'], String),
        storePhone: DataValidator.validateData(json['storePhone'], String),
        storeEmail: DataValidator.validateData(json['storeEmail'], String),
      );
  final int id;
  final String storeName;
  final String storeImage;
  final String storeDescription;
  final String storePhone;
  final String storeEmail;

  Vendor copyWith({
    int? id,
    String? storeName,
    String? storeImage,
    String? storeDescription,
    String? storePhone,
    String? storeEmail,
  }) =>
      Vendor(
        id: id ?? this.id,
        storeName: storeName ?? this.storeName,
        storeImage: storeImage ?? this.storeImage,
        storeDescription: storeDescription ?? this.storeDescription,
        storePhone: storePhone ?? this.storePhone,
        storeEmail: storeEmail ?? this.storeEmail,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'storeName': storeName,
        'storeImage': storeImage,
        'storeDescription': storeDescription,
        'storePhone': storePhone,
        'storeEmail': storeEmail,
      };
}
