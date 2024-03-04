import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    super.key,
    this.downloadProgress,
  });
  final double? downloadProgress;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: downloadProgress,
      strokeWidth: 2,
    );
  }
}
