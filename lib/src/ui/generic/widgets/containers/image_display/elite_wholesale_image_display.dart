import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../exports/constants_exports.dart'
    show Decorations, FontSizes, Spaces, ThemeColors;
import '../../../exports/widget_exports.dart'
    show CustomText, WidthSpacer;

class EliteWholesaleImageDisplay extends StatelessWidget {
  const EliteWholesaleImageDisplay({
    super.key,
    this.imageToDisplay,
    this.imageController,
    required this.imageTitle,
    this.imageUrl = ' ',
  });
  final XFile? imageToDisplay;
  final String? imageController;
  final String imageTitle;
  final String imageUrl;

  BoxDecoration? _getImageToDisplay() {
    if (imageToDisplay != null) {
      return BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: ThemeColors.kFontHintColor,
        ),
        borderRadius: BorderRadius.circular(
          100,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(imageToDisplay!.path),
          ),
        ),
      );
    }

    if (imageController != null) {
      if (imageController!.length < 300) {
        return BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: ThemeColors.kFontHintColor,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl + imageController!,
            ),
          ),
        );
      } else {
        return BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: ThemeColors.kFontHintColor,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: MemoryImage(
              base64Decode(imageController!),
            ),
          ),
        );
      }
    }

    return BoxDecoration(
      border: Border.all(
        width: 1.5,
        color: ThemeColors.kFontHintColor,
      ),
      borderRadius: BorderRadius.circular(
        100,
      ),
    );
  }

  bool doesImageExists() {
    if (imageToDisplay != null) {
      return true;
    }

    if (imageController != null) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Decorations.kWideButtonHeight + 20,
          width: Decorations.kWideButtonHeight + 20,
          decoration: _getImageToDisplay(),
          child: !doesImageExists()
              ? const Icon(
                  Icons.add,
                  color: ThemeColors.kFontHintColor,
                )
              : const SizedBox(),
        ),
        WidthSpacer(
          space: Spaces.defaultSpacingHorizontal * 2,
        ),
        CustomText(
          imageTitle,
          style: FontSizes.size14Regular(
            color: ThemeColors.kFontHintColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
