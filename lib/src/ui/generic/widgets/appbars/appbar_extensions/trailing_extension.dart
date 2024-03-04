import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';
import '../../../exports/widget_exports.dart';

class TrailingExtensionDisplay extends StatelessWidget {
  const TrailingExtensionDisplay({
    super.key,
    required this.showUserIcon,
    required this.userIconFunction,
    required this.showOtherIcon,
    this.otherIcon,
    this.otherIconWidget,
    required this.otherIconFunction,
    required this.showOtherIconNumber,
  });
  final bool showUserIcon, showOtherIcon, showOtherIconNumber;
  final IconData? otherIcon;
  final Widget? otherIconWidget;
  final VoidCallback? userIconFunction, otherIconFunction;

  //Add this in notification bloc when working with that
  Widget _getCount() {
    if (otherIconWidget != null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: Decorations.kAppBarTrailingButtonPadding - 4,
          horizontal: Decorations.kAppBarTrailingButtonPadding - 3,
        ),
        child: Align(
          alignment: AlignmentDirectional.topEnd,
          child: otherIconWidget,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _getWidget() {
    if (showUserIcon) {
      return Padding(
        padding: EdgeInsets.only(
          right: Spaces.defaultSpacingHorizontal * 1.5,
          left: Spaces.defaultSpacingHorizontal * 1.5,
        ),
        child: const CircleAvatar(
          child: SizedBox(),
          // UserBlocHelper.requestUserBlocForUserProfileImageDisplay(),
        ),
      );
    }
    if (showOtherIcon && otherIcon != null) {
      return Padding(
        padding: EdgeInsets.only(
          right: Spaces.defaultSpacingHorizontal * 0.5,
          left: Spaces.defaultSpacingHorizontal * 0.5,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: Icon(
                otherIcon,
                size: 35,
              ),
            ),
            if (showOtherIconNumber) _getCount(),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: () {
        if (showUserIcon || showOtherIcon) {
          if (userIconFunction != null) {
            userIconFunction!();
          }
          if (otherIconFunction != null) {
            otherIconFunction!();
          }
        }
      },
      child: _getWidget(),
    );
  }
}
