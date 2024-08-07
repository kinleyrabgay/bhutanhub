import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final TextEditingController textEditingController;
  final double borderRadius;
  final Color borderColor;
  final IconData suffixIcon;
  final VoidCallback onSuffixIconPressed;
  final bool validation;
  final String errorText;

  const CustomTextArea({
    super.key,
    required this.textEditingController,
    required this.borderRadius,
    required this.borderColor,
    required this.suffixIcon,
    required this.onSuffixIconPressed,
    required this.validation,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLines: null,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        ),
        errorText: validation ? errorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
