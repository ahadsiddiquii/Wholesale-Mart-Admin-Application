import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/screen_config.dart';
import '../../exports/constants_exports.dart';
import '../../exports/widget_exports.dart';

Future<VoidCallback?> eliteWholeSaleDoubleButtonDialogBoxWithWidgets({
  required BuildContext context,
  String? heading,
  String? text,
  String? iconPath,
  List<Widget>? widgets,
  String? button1Text,
  VoidCallback? button1,
  bool isButton1Transparent = false,
  String? button2Text,
  VoidCallback? button2,
  bool isButton2Transparent = false,
  bool barrierDismissable = false,
  bool willPopScope = false,
  bool verticalButtons = false,
  bool isVerticalSmallButtons = false,
  VoidCallback? thenFunction,
  Color? barrierColor,
  Color? button1CustomerColor,
  Color? button2CustomerColor,
}) {
  return showDialog(
    barrierColor: barrierColor ?? ThemeColors.kThemeColor.withOpacity(0.75),
    context: context,
    barrierDismissible: barrierDismissable,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async => willPopScope,
      child: AlertDialog(
        scrollable: true,
        actionsPadding: EdgeInsets.only(
          left: verticalButtons
              ? isVerticalSmallButtons
                  ? ScreenConfig.screenSizeWidth * 0.1
                  : ScreenConfig.screenSizeWidth * 0.02
              : ScreenConfig.screenSizeWidth * 0.1,
          right: verticalButtons
              ? isVerticalSmallButtons
                  ? ScreenConfig.screenSizeWidth * 0.1
                  : ScreenConfig.screenSizeWidth * 0.02
              : ScreenConfig.screenSizeWidth * 0.1,
          bottom: Decorations.kDialogBoxBottomPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Decorations.kDialogBoxRadius,
          ),
        ),
        title: (iconPath != null || heading != null)
            ? Column(
                children: [
                  if (iconPath != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Decorations.kDialogBoxIconBLRPadding,
                        right: Decorations.kDialogBoxIconBLRPadding,
                        bottom: Decorations.kDialogBoxIconBLRPadding,
                      ),
                      child: SvgPicture.asset(
                        iconPath,
                      ),
                    ),
                  if (heading != null)
                    CustomText(
                      heading,
                      textAlign: TextAlign.center,
                      style: FontSizes.size25Medium(
                        color: ThemeColors.kFontSecondaryBlueColor,
                      ),
                    ),
                ],
              )
            : null,
        content: (text != null || widgets != null)
            ? Column(
                children: [
                  if (text != null)
                    CustomText(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: FontSizes.size14Light(
                        color: ThemeColors.kFontPrimaryBlueColor,
                      ),
                    ),
                  if (widgets != null)
                    Column(
                      children: widgets,
                    )
                ],
              )
            : null,
        actionsAlignment: MainAxisAlignment.center,
        actions: ((button1Text != null && button1 != null) ||
                (button2Text != null && button2 != null))
            ? [
                if (verticalButtons) ...[
                  Column(
                    children: [
                      if (button1Text != null && button1 != null)
                        WideButton(
                          isTransparent: isButton1Transparent,
                          buttonHeight: Decorations.singleButtonHeight,
                          customColor:
                              button1CustomerColor ?? ThemeColors.kButtonColor,
                          onPressed: () {
                            button1();
                          },
                          buttonText: button1Text,
                        ),
                      HeightSpacer(
                        space: Spaces.fieldSpacingVertical,
                      ),
                      if (button2Text != null && button2 != null)
                        WideButton(
                          isTransparent: isButton2Transparent,
                          buttonHeight: Decorations.singleButtonHeight,
                          customColor:
                              button2CustomerColor ?? ThemeColors.kButtonColor,
                          onPressed: () {
                            button2();
                          },
                          buttonText: button2Text,
                        ),
                      const HeightSpacer(),
                    ],
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (button1Text != null && button1 != null)
                        WideButton(
                          isTransparent: isButton1Transparent,
                          buttonWidth: Decorations.singleButtonWidth,
                          buttonHeight: Decorations.singleButtonHeight,
                          customColor:
                              button1CustomerColor ?? ThemeColors.kButtonColor,
                          onPressed: () {
                            button1();
                          },
                          buttonText: button1Text,
                        ),
                      SizedBox(
                        width: ScreenConfig.screenSizeWidth * 0.02,
                      ),
                      if (button2Text != null && button2 != null)
                        WideButton(
                          isTransparent: isButton2Transparent,
                          buttonWidth: Decorations.singleButtonWidth,
                          buttonHeight: Decorations.singleButtonHeight,
                          customColor:
                              button2CustomerColor ?? ThemeColors.kButtonColor,
                          onPressed: () {
                            button2();
                          },
                          buttonText: button2Text,
                        )
                    ],
                  ),
                ]
              ]
            : null,
      ),
    ),
  ).then((_) {
    if (thenFunction != null) {
      thenFunction();
    }
    return null;
  });
}
