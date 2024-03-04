import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';

import '../../helper_functions/bar_code_service.dart';

class BarcodeListenerWidget extends StatelessWidget {
  const BarcodeListenerWidget({
    super.key,
    this.onSuccessFunction,
    required this.child,
  });

  final void Function(String)? onSuccessFunction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BarcodeKeyboardListener(
      bufferDuration: const Duration(milliseconds: 200),
      onBarcodeScanned: (barcode) async {
        debugPrint(barcode);
        try {
          SystemChannels.textInput.invokeMethod('TextInput.show');
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        } catch (e) {
          debugPrint(e.toString());
        }
        if (barcode.isNotEmpty && !BarcodeService.isBarCodeProcessing()) {
          debugPrint(barcode);
          BarcodeService.setCurrentProcessingBarcode(
            barcode,
          );
          if (onSuccessFunction != null) {
            onSuccessFunction!(barcode);
          }
        } else {
          debugPrint(
            "Couldn't process barcode",
          );
        }
      },
      child: child,
    );
  }
}
