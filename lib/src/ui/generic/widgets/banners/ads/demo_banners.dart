import 'package:flutter/material.dart';

import '../../../exports/assets_exports.dart' show ImageAssets;
import '../../../exports/enum_exports.dart' show BannerImage;
import 'ad_single_banner.dart';

class DemoBanners {
  DemoBanners._();
  static List<String> demoBanners = [
    ImageAssets.CHEETOS_BANNER_IMAGE_DUMMY,
    ImageAssets.VAPING_PRODUCTS_BANNER_IMAGE_DUMMY,
  ];

  static List<Widget> getBannerWidgets() {
    final List<Widget> adBanners = [];
    for (final banner in demoBanners) {
      adBanners.add(
        AdSingleBanner(
          bannerImagePath: banner,
          bannerType: BannerImage.asset,
        ),
      );
    }

    return adBanners;
  }
}
