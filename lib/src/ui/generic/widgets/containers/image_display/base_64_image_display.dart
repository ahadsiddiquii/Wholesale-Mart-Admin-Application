import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Base64ImageDisplay extends StatelessWidget {
  const Base64ImageDisplay({
    super.key,
    required this.base64Image,
  });
  final String base64Image;

  Uint8List? fetchBase64Image() {
    Uint8List? uint8List;

    try {
      uint8List = base64.decode(base64Image);
    } catch (e) {
      // Handle the case of an invalid base64 image
      debugPrint('Invalid base64 image data: $e');
    }
    return uint8List;
  }

  @override
  Widget build(BuildContext context) {
    final Uint8List? image = fetchBase64Image();
    if (image != null) {
      return Image.memory(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return const Icon(Icons.error);
    }
  }
}
