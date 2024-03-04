import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_colors.dart';

class CachedImageDisplay extends StatelessWidget {
  const CachedImageDisplay({
    super.key,
    required this.image,
    this.showAssetImage = false,
    this.fit = BoxFit.cover,
    this.errorIconColor = Colors.black,
  });
  final String image;
  final bool showAssetImage;
  final BoxFit fit;
  final Color errorIconColor;
  @override
  Widget build(BuildContext context) {
    if (showAssetImage) {
      return Image.asset(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: image,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(
          value: downloadProgress.progress,
          color: ThemeColors.kThemeColor,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: errorIconColor,
        ),
      );
    }
  }
}
