import '../../constants/decorations.dart';
import '../../constants/theme_colors.dart';
import '../../exports/space_exports.dart';

class EliteWholesaleBottomModalSheets {
  EliteWholesaleBottomModalSheets._();

  static void showEliteWholesaleBottomSheet({
    required BuildContext context,
    required List<Widget> widgets,
    bool givePadding = true,
    VoidCallback? processThenFunction,
    bool barrierDismissable = true,
  }) {
    showModalBottomSheet(
      enableDrag: true,
      useRootNavigator: true,
      isDismissible: barrierDismissable,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Decorations.kWideButtonBorderRadius,
          ),
          topRight: Radius.circular(
            Decorations.kWideButtonBorderRadius,
          ),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: givePadding ? Spaces.defaultSpacingHorizontal : 0,
            right: givePadding ? Spaces.defaultSpacingHorizontal : 0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.kFontSecondaryGreyColor,
                      ),
                    ),
                  ),
                ),
                ...widgets,
              ],
            ),
          ),
        );
      },
    );
  }
}
