import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../exports/assets_exports.dart';
import '../../exports/constants_exports.dart';
import '../../exports/widget_exports.dart';
import 'wms_drop_down_text_field.dart';

class WmsDecorationWrappedDropdown extends StatelessWidget {
  const WmsDecorationWrappedDropdown({
    super.key,
    this.controller,
    required this.hintText,
    required this.dropdownList,
    // ignore: unused_element
    this.dropDownHeight = 50,
    required this.onChanged,
    this.iconTapFunction,
    this.showPrefixButton = true,
  });

  final SingleValueDropDownController? controller;
  final String hintText;
  final bool showPrefixButton;
  final List<DropDownValueModel> dropdownList;
  final double dropDownHeight;
  final Function(DropDownValueModel) onChanged;
  final VoidCallback? iconTapFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dropDownHeight,
      padding: EdgeInsets.symmetric(
        horizontal: Decorations.kBorderMarginValue,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: Decorations.kAppBarSearchBoxShadow,
        ),
        child: Row(
          children: [
            if (showPrefixButton)
              Expanded(
                child: InkWellWrapper(
                  onTap: iconTapFunction,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: ThemeColors.kThemeColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        IconAssets.CAMERA_CAPTURE_ICON,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: const Radius.circular(
                      10,
                    ),
                    left: Radius.circular(
                      showPrefixButton ? 0 : 10,
                    ),
                  ),
                ),
                child: WMXPortalDropDownTextField(
                  controller: controller,
                  isTransparent: true,
                  hintText: hintText,
                  dropDownList: dropdownList,
                  overrideOnChange: true,
                  onChanged: (val) => onChanged(val),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
