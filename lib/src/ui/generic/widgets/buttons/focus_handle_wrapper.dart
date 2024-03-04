import 'package:flutter/material.dart';

import '../../helper_functions/unfocus_handler.dart';

class FocusHandler extends StatelessWidget {
  const FocusHandler({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: UnfocusHandler.unFocusPrimaryFocus,
      child: child,
    );
  }
}
