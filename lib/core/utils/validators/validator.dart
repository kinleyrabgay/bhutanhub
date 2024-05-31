class BHValidator {
  const BHValidator._();

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
      // return '';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
      // return '';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
      // return '';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*()":{}|<>]'))) {
      return 'Password must contain at least one special character';
      // return '';
    }

    return null;
  }

  static String? validatePasswordConfirm(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value != password) {
      return "Enter passwords don't match";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegexExp = RegExp(r'^\d{8}$');

    if (!phoneRegexExp.hasMatch(value)) {
      return 'Invalid phone number format (8 degits required)';
    }

    return null;
  }
}
