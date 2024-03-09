import 'package:flutter/material.dart';

class DataValidator {
  DataValidator._();

  static dynamic getRunTimeTypeDefaultValueWhenNull(
    Type value,
    dynamic nullItem,
  ) {
    if (value == String) {
      return nullItem ?? '-1';
    }
    if (value == int) {
      return nullItem ?? -1;
    }
    if (value == bool) {
      return nullItem ?? false;
    }
    if (value == double) {
      return nullItem ?? -1.0;
    } else {
      return 'Not Found';
    }
  }

  static dynamic validateData(
    dynamic data,
    Type returnRuntimeType, {
    bool isNullable = false,
    dynamic nullItem,
  }) {
    try {
      if (data != null) {
        if (returnRuntimeType == String &&
            (data.runtimeType == int || data.runtimeType == double)) {
          return data.toString();
        }
        if (returnRuntimeType == int && data.runtimeType == String) {
          return int.parse(data);
        }
        if (returnRuntimeType == double && data.runtimeType == String) {
          return double.parse(data);
        }
        if (returnRuntimeType == int && data.runtimeType == double) {
          return data.toInt();
        }

        if (returnRuntimeType == double && data.runtimeType == int) {
          return data.toDouble();
        }
        return data;
      } else {
        if (isNullable) {
          return data;
        }
        return getRunTimeTypeDefaultValueWhenNull(
          returnRuntimeType,
          nullItem,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return getRunTimeTypeDefaultValueWhenNull(
        returnRuntimeType,
        nullItem,
      );
    }
  }

  static List<dynamic> validateList(
    dynamic data,
    Type dataType,
  ) {
    List<dynamic> listToReturn = [];
    if (data != null) {
      if (dataType == String) {
        listToReturn = List<String>.from(data.map((x) => x));
      } else {
        listToReturn = List.from(data.map((x) => x));
      }
    }
    return listToReturn;
  }
}
