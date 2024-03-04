import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../generic/exports/constants_exports.dart' show ThemeColors;
import '../../../../generic/helper_functions/bar_code_service.dart';
import '../../../../generic/widgets/appbars/barcode_listener_widget.dart';

class LazerScanWidget extends StatelessWidget {
  const LazerScanWidget({
    super.key,
    required this.func,
  });

  final Function(String)? func;

  @override
  Widget build(BuildContext context) {
    return BarcodeListenerWidget(
      onSuccessFunction: (String barcode) {
        debugPrint(barcode);
        if (func != null) {
          func!(
            barcode,
          );
          Navigator.pop(context);
          BarcodeService.setCurrentProcessingBarcode(
            '',
          );
        }
      },
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ThemeColors.kThemeColor,
        size: 40,
      ),
    );
  }
}
