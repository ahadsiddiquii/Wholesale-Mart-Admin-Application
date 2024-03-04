import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../generic/constants/spaces.dart';
import '../../../../generic/exports/helper_functions_exports.dart';
import '../../../../generic/exports/widget_exports.dart';
import '../../category_model/category.dart';

class AddUpdateCategoryItemDisplay extends StatefulWidget {
  const AddUpdateCategoryItemDisplay({
    super.key,
    this.category,
  });

  final Category? category;

  @override
  State<AddUpdateCategoryItemDisplay> createState() =>
      _AddUpdateCategoryItemDisplayState();
}

class _AddUpdateCategoryItemDisplayState
    extends State<AddUpdateCategoryItemDisplay> {
  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  TextEditingController categoryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: categoryFormKey,
      child: Column(
        children: [
          //
          EliteWholesalePrimaryTextField(
            hintText: 'Name',
            showFieldShadow: true,
            prefixIcon: Iconsax.category_2_outline,
            controller: categoryNameController,
            keyboadType: TextInputType.text,
            validator: (val) => FieldValidator.genericTextValidator(
              val!,
              'Please enter category name.',
            ),
            onChanged: (val) {
              // signInFormKey.currentState!.validate();
            },
          ),
          HeightSpacer(
            space: Spaces.defaultSpacingVertical * 2,
          ),
          WideButton(
            onPressed: () {
              if (categoryFormKey.currentState!.validate()) {}
            },
            borderAlreadyGiven: true,
            buttonText: 'Save',
          ),
        ],
      ),
    );
  }
}
