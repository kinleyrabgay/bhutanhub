import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class PasswordStrengthWidget extends StatelessWidget {
  const PasswordStrengthWidget({
    super.key,
    required double passwordStrength,
    required String passwordStrengthText,
  })  : _passwordStrength = passwordStrength,
        _passwordStrengthText = passwordStrengthText;

  final double _passwordStrength;
  final String _passwordStrengthText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: BHSizes.spaceItems / 2),
        LinearProgressIndicator(
          value: _passwordStrength,
          backgroundColor: BHColors.grey,
          color: _passwordStrength < 0.5 ? Colors.red : Colors.green,
          minHeight: 5,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: BHSizes.spaceItems / 2),
        Text(
          _passwordStrengthText,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: _passwordStrength < 0.5 ? Colors.red : Colors.green,
              ),
        ),
      ],
    );
  }
}
