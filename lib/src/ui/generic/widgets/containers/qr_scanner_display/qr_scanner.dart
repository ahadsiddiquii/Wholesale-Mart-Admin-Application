import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../assets/icon_assets.dart';
import '../../../exports/widget_exports.dart';
import '../../../loaders/circle_rounded_loader.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({
    super.key,
    required this.qrFunction,
  });
  final Function(String) qrFunction;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool showLoader = true;
  bool checkingResult = false;

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      showLoader = false;
    });
    this.controller = controller;
    controller.scannedDataStream.listen(
      (
        scanData,
      ) {
        if (!checkingResult &&
            (result == null ||
                (result != null && (result!.code! != scanData.code)))) {
          setState(() {
            result = scanData;
            checkingResult = true;
            showLoader = true;
          });
          fetchingResult();
        }
      },
    );
  }

  void fetchingResult() {
    if (result != null && result!.code != null) {
      try {
        widget.qrFunction(result!.code!);
      } catch (e) {
        debugPrint(e.toString());
        eliteWholeSaleDialogBoxWithWidgets(
          context: context,
          heading: 'Incorrect!',
          iconPath: IconAssets.DIALOG_CROSS_ICON,
          text: 'Please enter a valid QR code.',
          button1: () {
            setState(() {
              showLoader = false;
              checkingResult = false;
              result = null;
            });
            Navigator.pop(
              context,
            );
          },
          button1Text: 'Try Again',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ),
        if (showLoader)
          const ColoredBox(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleRoundedLoader(),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
