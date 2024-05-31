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

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class AuthLoading extends AuthenticationState {
  const AuthLoading();
}

class SignedIn extends AuthenticationState {
  const SignedIn(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class SignedUp extends AuthenticationState {
  const SignedUp();
}

class ForgotPasswordSent extends AuthenticationState {
  const ForgotPasswordSent();
}

class UserUpdated extends AuthenticationState {
  const UserUpdated();
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
