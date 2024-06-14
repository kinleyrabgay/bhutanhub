class BHFirebasePlatformException implements Exception {
  final String code;

  BHFirebasePlatformException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return 'Permission denied. You do not have access to perform this action.';
      case 'unavailable':
        return 'Service unavailable. Please try again later.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption occurred.';
      case 'internal':
        return 'Internal error occurred. Please try again later.';
      case 'deadline-exceeded':
        return 'Deadline exceeded. The operation took too long to complete.';
      case 'data-stale':
        return 'The data was updated between when the client read it and when the client tried to write it.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'unauthorized':
        return 'Unauthorized. User is not authorized to perform the desired action.';
      case 'retry-limit-exceeded':
        return 'Retry limit exceeded. Maximum time limit on retries has been exceeded.';
      case 'network-error':
        return 'Network error. The operation could not be performed due to a network issue.';
      case 'object-not-found':
        return 'Object not found. The specified object was not found in the storage.';
      case 'unknown':
        return 'Unknown error occurred.';
      case 'invalid-argument':
        return 'Invalid argument provided.';
      case 'not-found':
        return 'Requested resource was not found.';
      case 'already-exists':
        return 'The resource already exists.';
      case 'resource-exhausted':
        return 'Resource exhausted. The project or user exceeded a resource limit.';
      case 'failed-precondition':
        return 'Operation failed precondition. The system is not in a state required for the operation.';
      case 'aborted':
        return 'Operation aborted due to a concurrency issue.';
      case 'out-of-range':
        return 'Operation out of range. The operation was attempted past the valid range.';
      case 'unimplemented':
        return 'Operation is not implemented or not supported/enabled.';
      default:
        return 'Unknown error occurred.';
    }
  }
}
