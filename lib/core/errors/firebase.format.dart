class BHFirebaseFormatException implements Exception {
  final String code;

  BHFirebaseFormatException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'malformed-email':
        return 'The email address format is incorrect. Please check and try again.';
      case 'invalid-phone-number':
        return 'The phone number provided is invalid. Please enter a valid phone number.';
      case 'malformed-phone-number':
        return 'The phone number format is incorrect. Please check and try again.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired. Please try again.';
      case 'malformed-credential':
        return 'The credential format is incorrect. Please check and try again.';
      case 'invalid-verification-code':
        return 'The verification code provided is invalid. Please enter a valid code.';
      case 'malformed-verification-code':
        return 'The verification code format is incorrect. Please check and try again.';
      case 'invalid-custom-claim':
        return 'The custom claim provided is invalid. Please verify and try again.';
      case 'malformed-custom-claim':
        return 'The custom claim format is incorrect. Please check and try again.';
      case 'invalid-argument':
        return 'Invalid argument provided. Please verify and try again.';
      case 'malformed-argument':
        return 'Malformed argument format. Please check and try again.';
      case 'unsupported-provider':
        return 'Unsupported provider. The authentication provider is not supported.';
      case 'malformed-provider':
        return 'Malformed provider format. Please check and try again.';
      case 'invalid-payload':
        return 'Invalid payload provided. Please verify and try again.';
      case 'malformed-payload':
        return 'Malformed payload format. Please check and try again.';
      case 'invalid-namespace':
        return 'Invalid namespace provided. Please verify and try again.';
      case 'malformed-namespace':
        return 'Malformed namespace format. Please check and try again.';
      case 'invalid-code-retry':
        return 'Invalid code retry limit reached. Please try again later.';
      case 'malformed-code-retry':
        return 'Malformed code retry format. Please check and try again.';
      case 'invalid-app-id':
        return 'Invalid App ID provided. Please verify and try again.';
      case 'malformed-app-id':
        return 'Malformed App ID format. Please check and try again.';
      default:
        return 'Unknown error occurred. Please try again.';
    }
  }
}
