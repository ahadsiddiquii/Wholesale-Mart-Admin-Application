import 'package:flutter/material.dart';

import '../../exports/assets_exports.dart' show ImageAssets;

class ErrorHandledNetworkImage extends StatelessWidget {
  const ErrorHandledNetworkImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          ImageAssets.DHA_MART_LOGO,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
