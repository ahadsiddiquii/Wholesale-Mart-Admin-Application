import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../configs/screen_config.dart';
import '../../constants/spaces.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;
import '../../exports/widget_exports.dart' show CustomText, WideButton;
import '../spacers/height_spacer.dart';

Future<VoidCallback?> eliteWholeSaleDialogBoxWithWidgets({
  required BuildContext context,
  String? heading,
  String? text,
  String? iconPath,
  IconData? iconData,
  bool isAnimatedAsset = false,
  List<Widget>? widgets,
  String? button1Text,
  VoidCallback? button1,
  bool barrierDismissable = false,
  bool willPopScope = false,
  VoidCallback? thenFunction,
  Color? barrierColor,
  Color? dialogBackgroundColor,
  Color? buttonCustomerColor,
}) {
  return showDialog(
    barrierColor: barrierColor ?? ThemeColors.kThemeColor.withOpacity(0.75),
    context: context,
    barrierDismissible: barrierDismissable,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async => willPopScope,
      child: AlertDialog(
        backgroundColor: dialogBackgroundColor,
        scrollable: true,
        actionsPadding: EdgeInsets.only(
          left: ScreenConfig.screenSizeWidth * 0.1,
          right: ScreenConfig.screenSizeWidth * 0.1,
          bottom: Decorations.kDialogBoxBottomPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Decorations.kDialogBoxRadius,
          ),
        ),
        title: (iconPath != null || heading != null || iconData != null)
            ? Column(
                children: [
                  if (iconData != null) ...[
                    Icon(
                      iconData,
                      color: ThemeColors.kThemeColor,
                      size: 70,
                    ),
                    HeightSpacer(
                      space: Spaces.smallestSpacingVertical,
                    ),
                  ],
                  if (iconPath != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Decorations.kDialogBoxIconBLRPadding,
                        right: Decorations.kDialogBoxIconBLRPadding,
                        bottom: Decorations.kDialogBoxIconBLRPadding,
                      ),
                      child: isAnimatedAsset
                          ? SizedBox(
                              height: 165,
                              width: 165,
                              child: LottieBuilder.asset(
                                iconPath,
                                repeat: false,
                              ),
                            )
                          : SvgPicture.asset(
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
        actions: (button1Text != null && button1 != null)
            ? [
                WideButton(
                  customColor: buttonCustomerColor ?? ThemeColors.kButtonColor,
                  buttonWidth: ScreenConfig.screenSizeWidth * 0.6,
                  onPressed: () {
                    button1();
                  },
                  buttonText: button1Text,
                )
              ]
            : null,
      ),
    ),
  ).then(
    (value) => thenFunction,
  );
}
