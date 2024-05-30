import 'package:bhutan_hub/core/errors/exception.dart';
import 'package:equatable/equatable.dart';

// Interface
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

// Server
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.statusCode,
  });
}

// API
class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode,
  });

  APIFailure.fromException(APIException e)
      : this(
          message: e.message,
          statusCode: e.statusCode,
        );
}
