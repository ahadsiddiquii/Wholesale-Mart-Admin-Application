import 'package:flutter/material.dart';

import '../../constants/theme_colors.dart';
import '../../exports/helper_functions_exports.dart';
import 'dialog_box_used_texts.dart';
import 'elite_wholesale_customer_double_button_dialog_box.dart';

class UsedDialogs {
  UsedDialogs._();

  static void logout(
    BuildContext context,
  ) {
    eliteWholeSaleDoubleButtonDialogBoxWithWidgets(
      context: context,
      barrierDismissable: true,
      willPopScope: true,
      heading: DialogBoxUsedTexts.LOGOUT,
      text: DialogBoxUsedTexts.AREYOUSUREYOUWANTTOLOGOUT,
      button1Text: DialogBoxUsedTexts.NO,
      button1: () {
        Navigator.pop(
          context,
        );
      },
      button1CustomerColor: ThemeColors.kFontPrimaryBlueColor,
      isButton1Transparent: true,
      button2Text: DialogBoxUsedTexts.YES,
      button2: () {
        // UserBlocHelper.logout(
        //   context,
        // );
        NavigationBarHandler.closeDrawer();
      },
      button2CustomerColor: Colors.red,
    );
  }

  static void stepBack(
    BuildContext context, {
    required VoidCallback functionIfYes,
  }) {
    eliteWholeSaleDoubleButtonDialogBoxWithWidgets(
      context: context,
      barrierDismissable: true,
      willPopScope: true,
      heading: '${DialogBoxUsedTexts.GOBACK}?',
      text: DialogBoxUsedTexts.YOUWILLLOSEYOURCURRENTSELECTIONIFYOUGOBACK,
      button1Text: DialogBoxUsedTexts.NO,
      button1: () {
        Navigator.pop(
          context,
        );
      },
      button1CustomerColor: ThemeColors.kButtonDarkBlueColor,
      isButton1Transparent: true,
      button2Text: DialogBoxUsedTexts.YES,
      button2: () {
        Navigator.pop(
          context,
        );
        functionIfYes();
      },
      button2CustomerColor: ThemeColors.kButtonDarkBlueColor,
    );
  }
}
