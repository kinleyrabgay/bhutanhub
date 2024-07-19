import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.searchHintText,
    this.prefixText,
    this.keyboardType,
    this.onChanged,
    required this.dropDownList,
    this.enableSearch = true,
    this.dropDownItemCount = 8,
  });

  final SingleValueDropDownController controller;
  final String labelText;
  final String? hintText, searchHintText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final Function(dynamic)? onChanged;
  final List<DropDownValueModel> dropDownList;
  final bool enableSearch;
  final int dropDownItemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.labelLarge!,
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        DropDownTextField(
          controller: controller,
          clearOption: true,
          dropdownRadius: 4,
          enableSearch: enableSearch,
          clearIconProperty: IconProperty(
            color: BHColors.primary.withOpacity(0.5),
            size: 18,
          ),
          searchTextStyle: Theme.of(context).textTheme.labelLarge,
          searchDecoration: InputDecoration(
            hintText: searchHintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            hintStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            prefixText: prefixText,
            prefixStyle: Theme.of(context).textTheme.labelLarge,
          ),
          dropDownItemCount: dropDownItemCount,
          dropDownList: dropDownList,
          dropDownIconProperty: IconProperty(
            color: BHColors.primary.withOpacity(0.5),
            size: 18,
            icon: Iconsax.arrow_down_1,
          ),
          onChanged: onChanged,
          textFieldDecoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            prefixText: prefixText,
            prefixStyle: Theme.of(context).textTheme.labelLarge,
          ),
          listTextStyle: Theme.of(context).textTheme.labelLarge,
          textFieldFocusNode: FocusNode(),
        ),
      ],
    );
  }
}
