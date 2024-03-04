import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeService {
  BarcodeService._();

  static String stackTopScreen = '';
  static String _currentProcessingBarcode = '';
  static bool _insideManualSearchScreen = false;
  // ignore: use_setters_to_change_properties
  static void setInsideManualSearchScreen(bool status) {
    _insideManualSearchScreen = status;
  }

  static bool getInsideManualSearchScreenStatus() {
    return _insideManualSearchScreen;
  }

  // ignore: use_setters_to_change_properties
  static void setCurrentProcessingBarcode(String barCode) {
    _currentProcessingBarcode = barCode;
  }

  static String getCurrentProcessingBarcode() {
    return _currentProcessingBarcode;
  }

  static bool isBarCodeProcessing() {
    if (_currentProcessingBarcode.isNotEmpty) {
      return true;
    }
    return false;
  }

  static Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    )!
        .listen(
      (barcode) => debugPrint(
        barcode,
      ),
    );
  }

  static Future<String> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return barcodeScanRes;
  }
}
