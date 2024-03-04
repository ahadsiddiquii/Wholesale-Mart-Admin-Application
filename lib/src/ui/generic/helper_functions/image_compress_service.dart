import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressService {
  ImageCompressService._();
  static Future<Uint8List> compressMemoryImage(Uint8List imageBytes) async {
    final result = await FlutterImageCompress.compressWithList(
      imageBytes,
      minHeight: 1920,
      minWidth: 1080,
      quality: 30,
    );

    return result;
  }

  static Future<File> compressFile(File file) async {
    try {
      final bytes = file.readAsBytesSync().lengthInBytes;
      var kb = bytes / 1024;
      var mb = kb / 1024;
      debugPrint('Before Compress Size: $mb');

      if (mb > 1) {
        final quality = (100 / mb).floor();

        final filePath = file.absolute.path;
        debugPrint('File Path: $filePath');

        final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
        final splitted = filePath.substring(0, lastIndex);

        final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
        final result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          outPath,
          quality: quality,
        );
        final resultFile = File(result!.path);
        debugPrint('f');
        final bytes = resultFile.readAsBytesSync().lengthInBytes;
        kb = bytes / 1024;
        mb = kb / 1024;
        debugPrint('After Compress Size: $mb');

        file = resultFile;
      }

      return file;
    } catch (e) {
      debugPrint('Error In Compressing Image: $e');
      return file;
    }
  }

  bool isImageLesserThanDefinedSize(XFile pickedFile) {
    final file = File(pickedFile.path);
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;

    if (mb < 6) {
      return true;
    } else {
      return false;
    }
  }
}
