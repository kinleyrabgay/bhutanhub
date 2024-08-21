part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationLoading extends AuthenticationState {}

class Authenticating extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class Authenticated extends AuthenticationState {
  const Authenticated(this.user);

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class LogoutSuccess extends AuthenticationState {
  const LogoutSuccess();
}

class Error extends AuthenticationState {
  const Error({
    this.error,
    this.message,
  });

  final ErrorType? error;
  final String? message;

  @override
  List<Object> get props => [];
}

class Success extends AuthenticationState {
  const Success({required this.success});

  final SuccessType success;

  @override
  List<Object> get props => [success];
}

class UserSignedUp extends AuthenticationState {
  const UserSignedUp();
}

class ForgotPasswordSent extends AuthenticationState {
  const ForgotPasswordSent();
}

class UserUpdated extends AuthenticationState {
  const UserUpdated();
}

// Cache Credentials
class CacheCredentialsSuccess extends AuthenticationState {
  const CacheCredentialsSuccess();
}

class CacheCredentialsFailure extends AuthenticationState {
  const CacheCredentialsFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
