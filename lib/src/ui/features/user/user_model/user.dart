import 'dart:convert';

import '../../../generic/apis/data_validator.dart';

class User {
  User({
    required this.id,
    required this.userName,
    required this.userEmailOrPhone,
    required this.roles,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: DataValidator.validateData(json['id'], int),
        userName: DataValidator.validateData(json['userName'], String),
        userEmailOrPhone:
            DataValidator.validateData(json['userEmailOrPhone'], String),
        roles:
            DataValidator.validateList(json['roles'], String) as List<String>,
      );
  final int id;
  final String userName;
  final String userEmailOrPhone;
  final List<String> roles;

  User copyWith({
    int? id,
    String? userName,
    String? userEmailOrPhone,
    List<String>? roles,
  }) =>
      User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        userEmailOrPhone: userEmailOrPhone ?? this.userEmailOrPhone,
        roles: roles ?? this.roles,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'userEmailOrPhone': userEmailOrPhone,
        'roles': List<dynamic>.from(roles.map((x) => x)),
      };
}
