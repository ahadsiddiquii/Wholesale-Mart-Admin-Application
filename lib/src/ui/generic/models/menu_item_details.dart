import 'package:flutter/material.dart';

class ItemDetails {
  ItemDetails({
    required this.itemId,
    required this.itemName,
    required this.itemImage,
    required this.onTap,
    this.extraText,
    this.needsTranslation = true,
  });
  String itemId;
  bool needsTranslation;
  String itemName;
  String itemImage;
  String? extraText;
  VoidCallback onTap;
}
