import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/generic_used_texts.dart';
import '../../constants/spaces.dart';
import '../../helper_functions/image_compress_service.dart';
import '../buttons/wide_button.dart';
import '../spacers/height_spacer.dart';
import 'elite_wholesale_bottom_modal_sheet.dart';

class PickImage {
  PickImage._();

  static Future<(String, String)> getFileNameAndBase64Image(
      XFile imageFile) async {
    final File image =
        await ImageCompressService.compressFile(File(imageFile.path));
    final List<int> imageBytes = await image.readAsBytes();
    final String base64Image = base64Encode(imageBytes);
    final String fileName = imageFile.path.split('/').last;
    return (fileName, base64Image);
  }

  static void pickImageBottomSheet(
    BuildContext context,
    Function(XFile) filePickerHandle,
  ) {
    EliteWholesaleBottomModalSheets.showEliteWholesaleBottomSheet(
      givePadding: false,
      context: context,
      widgets: [
        _ImagePickerBottomSheetContent(
          filePickerHandle: filePickerHandle,
        )
      ],
    );
  }
}

class _ImagePickerBottomSheetContent extends StatelessWidget {
  const _ImagePickerBottomSheetContent({
    required this.filePickerHandle,
  });
  final Function(XFile) filePickerHandle;

  Future<XFile?> _pickImage(
    ImageSource source,
  ) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedXFile = await picker.pickImage(
        source: source,
      );
      if (pickedXFile != null) {
        return pickedXFile;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeightSpacer(
          space: Spaces.smallestSpacingVertical,
        ),
        WideButton(
          onPressed: () async {
            final XFile? pickedXFile = await _pickImage(
              ImageSource.camera,
            );
            if (pickedXFile != null) {
              filePickerHandle(pickedXFile);
            }
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          buttonText: GenericUsedText.CAPTUREFROMCAMERA,
        ),
        HeightSpacer(
          space: Spaces.fieldSpacingVertical,
        ),
        WideButton(
          onPressed: () async {
            final XFile? pickedXFile = await _pickImage(
              ImageSource.gallery,
            );
            if (pickedXFile != null) {
              filePickerHandle(pickedXFile);
            }
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          buttonText: GenericUsedText.PICKFROMGALLERY,
          isTransparent: true,
        ),
        const HeightSpacer(),
      ],
    );
  }
}
