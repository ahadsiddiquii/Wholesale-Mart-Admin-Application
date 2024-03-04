import 'package:flutter/material.dart';

import '../dividers/elite_wholesale_custom_divider.dart';

class EliteWholesaleListView extends StatelessWidget {
  const EliteWholesaleListView({
    super.key,
    required this.listMap,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });
  final List<Widget> listMap;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: listMap.length,
        separatorBuilder: (context, index) {
          return const EliteWholesaleCustomDivider();
        },
        itemBuilder: (context, index) {
          return listMap[index];
        });
  }
}
