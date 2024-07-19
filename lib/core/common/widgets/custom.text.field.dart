import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.prefixText,
    this.keyboardType,
    this.onChanged,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

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
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            prefixText: prefixText,
            prefixStyle: Theme.of(context).textTheme.labelLarge,
          ),
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
