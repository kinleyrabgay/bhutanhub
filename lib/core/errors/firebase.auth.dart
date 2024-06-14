class BHFirebaseAuthException implements Exception {
  final String code;

  const BHFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'Email already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'Provider already linked to another account.';
      case 'invalid-credential':
        return 'Invalid credentials provided.';
      case 'operation-not-allowed':
        return 'Requested operation is not allowed.';
      case 'user-disabled':
        return 'User account is disabled.';
      case 'user-token-expired':
        return 'User token has expired. Please sign in again.';
      case 'too-many-requests':
        return 'Too many sign-in attempts. Try again later.';
      case 'network-request-failed':
        return 'Network request failed. Check your internet connection.';
      case 'internal-error':
        return 'Internal error occurred. Please try again later.';
      case 'app-deleted':
        return 'Firebase app instance has been deleted.';
      case 'user-mismatch':
        return 'User mismatch error.';
      case 'provider-not-linked':
        return 'Account provider not linked.';
      case '[firebase_auth/invalid-credential] The supplied auth credential is malformed or has expired.':
        return 'The supplied auth credential is malformed or has expired.';
      default:
        return 'Unhandled Firebase Auth exception code';
    }
  }
}
