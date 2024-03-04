import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../constants/theme_colors.dart';

class UserProfileDisplay extends StatelessWidget {
  const UserProfileDisplay({
    super.key,
    required this.image,
    this.isBase64 = true,
    this.diameter = 40,
    this.invertedErrorColors = false,
    this.invertCustomBackgroundColor = ThemeColors.kButtonDarkBlueColor,
  });

  final String image;
  final bool isBase64;
  final double diameter;
  final bool invertedErrorColors;
  final Color invertCustomBackgroundColor;

  Uint8List? fetchBase64Image() {
    Uint8List? uint8List;

    try {
      uint8List = base64.decode(image);
    } catch (e) {
      // Handle the case of an invalid base64 image
      debugPrint('Invalid base64 image data: $e');
    }
    return uint8List;
  }

  Widget? _getErrorWidget(dynamic image) {
    if (image != null && image.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isBase64
            ? Image.memory(
                image,
                gaplessPlayback: true,
                fit: BoxFit.cover,
              )
            : Image.network(
                image,
                fit: BoxFit.cover,
              ),
      );
    }
    if (image == null || image.isEmpty) {
      return Icon(
        Icons.person,
        color: invertedErrorColors
            ? Colors.white
            : ThemeColors.kButtonDarkBlueColor,
        size: diameter / 2,
      );
    }

    return null;
  }

  BoxDecoration? _getImageToDisplay(dynamic image) {
    return BoxDecoration(
      color: (!(image != null && image.isNotEmpty) && invertedErrorColors)
          ? invertCustomBackgroundColor
          : Colors.white,
      borderRadius: BorderRadius.circular(
        100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getImageToDisplay(
        isBase64 ? fetchBase64Image() : image,
      ),
      height: diameter,
      width: diameter,
      child: _getErrorWidget(
        isBase64 ? fetchBase64Image() : image,
      ),
    );
  }
}
