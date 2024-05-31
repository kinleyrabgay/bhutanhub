class PasswordStrength {
  final double strength;
  final String strengthText;

  PasswordStrength({required this.strength, required this.strengthText});
}

PasswordStrength checkPasswordStrength(String password) {
  double strength = 0;
  String strengthText = '';

  if (password.isNotEmpty) {
    // Check password length
    if (password.length >= 8) {
      strength += 0.25;
    }

    // Check for numbers
    if (RegExp(r'\d').hasMatch(password)) {
      strength += 0.25;
    }

    // Check for letters
    if (RegExp(r'[a-zA-Z]').hasMatch(password)) {
      strength += 0.25;
    }

    // Check for special characters
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      strength += 0.25;
    }

    // Determine strength text
    if (strength == 1) {
      strengthText = 'Strong';
    } else if (strength >= 0.75) {
      strengthText = 'Good';
    } else if (strength >= 0.5) {
      strengthText = 'Weak';
    } else {
      strengthText = 'Very Weak';
    }
  }

  return PasswordStrength(strength: strength, strengthText: strengthText);
}
