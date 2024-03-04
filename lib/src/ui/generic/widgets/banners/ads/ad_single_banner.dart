import 'package:flutter/material.dart';

import '../../../../configs/screen_config.dart';
import '../../../constants/decorations.dart';
import '../../../exports/enum_exports.dart' show BannerImage;
import '../../../exports/widget_exports.dart' show ErrorHandledNetworkImage;

class AdSingleBanner extends StatelessWidget {
  const AdSingleBanner({
    super.key,
    required this.bannerImagePath,
    required this.bannerType,
  });
  final String bannerImagePath;
  final BannerImage bannerType;

  Widget _getBanner() {
    if (bannerType == BannerImage.asset) {
      return Image.asset(
        bannerImagePath,
        fit: BoxFit.cover,
      );
    }
    if (bannerType == BannerImage.network) {
      return ErrorHandledNetworkImage(
        imagePath: bannerImagePath,
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenConfig.screenSizeHeight * 0.22,
      margin: Decorations.kBorderMargin,
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          Decorations.kContainerRadius,
        ),
        child: SizedBox.expand(
          child: _getBanner(),
        ),
      ),
    );
  }
}
