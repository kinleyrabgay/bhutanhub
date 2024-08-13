import 'package:bhutanhub/core/common/widgets/single.custom.dropdown.field.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/brand_constant.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/category_constant.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class Step2 extends StatelessWidget {
  const Step2({
    super.key,
    required this.brandController,
    required this.categoryController,
  });

  final SingleValueDropDownController brandController;
  final SingleValueDropDownController categoryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Product Category ---
        SingleCustomDropDownTextField(
          singleValueDropDownController: categoryController,
          labelText: BHTexts.category,
          hintText: BHTexts.hintCategory,
          searchHintText: BHTexts.searchCategory,
          dropDownItemCount: 3,
          dropDownList: categoryList,
          onChanged: (val) {
            print(val);
          },
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),

        // --- Product Brand ---
        SingleCustomDropDownTextField(
          singleValueDropDownController: brandController,
          labelText: BHTexts.brand,
          hintText: BHTexts.hintBrand,
          searchHintText: BHTexts.searchBrand,
          dropDownItemCount: 3,
          dropDownList: brandList,
          onChanged: (val) {},
        ),
        const SizedBox(height: BHSizes.spaceSections / 2),
      ],
    );
  }
}
