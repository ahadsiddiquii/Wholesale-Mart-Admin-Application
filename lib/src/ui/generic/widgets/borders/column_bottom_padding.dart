import 'package:flutter/material.dart';

import '../../exports/widget_exports.dart';

class ColumnBottomPadding extends StatelessWidget {
  const ColumnBottomPadding({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: children,
          ),
          const HeightSpacer(),
        ],
      ),
    );
  }
}
