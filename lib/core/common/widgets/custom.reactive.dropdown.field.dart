import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDropDownTextField extends StatelessWidget {
  const CustomReactiveDropDownTextField({
    super.key,
    required this.formControlName,
    required this.labelText,
    this.hintText,
    this.searchHintText,
    this.prefixText,
    required this.dropDownList,
    this.enableSearch = true,
    this.dropDownItemCount = 8,
  });

  final String formControlName;
  final String labelText;
  final String? hintText, searchHintText;
  final String? prefixText;
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
        ReactiveDropdownField<dynamic>(
          formControlName: formControlName,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            prefixText: prefixText,
            prefixStyle: Theme.of(context).textTheme.labelLarge,
          ),
          items: dropDownList.map<DropdownMenuItem>(
            (DropDownValueModel item) {
              return DropdownMenuItem(
                value: item.value,
                child: Text(item.name),
              );
            },
          ).toList(),
          dropdownColor: Colors.white,
          isExpanded: true,
          onChanged: (value) {
            // Handle value change if needed
          },
        ),
      ],
    );
  }
}
