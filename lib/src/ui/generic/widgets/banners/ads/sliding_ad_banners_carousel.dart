import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../configs/screen_config.dart';
import '../../../exports/constants_exports.dart' show ThemeColors;
import 'demo_banners.dart';

class SlidingAdBannerCarousel extends StatefulWidget {
  const SlidingAdBannerCarousel({super.key});

  @override
  State<SlidingAdBannerCarousel> createState() =>
      _SlidingAdBannerCarouselState();
}

class _SlidingAdBannerCarouselState extends State<SlidingAdBannerCarousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: DemoBanners.getBannerWidgets(),
          options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(seconds: 2),
              height: ScreenConfig.screenSizeHeight * 0.22,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (value, _) {
                setState(() {
                  currentIndex = value;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: DemoBanners.demoBanners.map((imageUrl) {
            final int index = DemoBanners.demoBanners.indexOf(imageUrl);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == currentIndex
                    ? ThemeColors.kFontSecondaryBlueColor
                    : ThemeColors.kFontPrimaryGreyColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
