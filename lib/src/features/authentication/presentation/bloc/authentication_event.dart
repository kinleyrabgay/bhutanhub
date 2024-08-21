part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  const LoginEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}

class RegisterEvent extends AuthenticationEvent {
  const RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  @override
  List<String> get props => [email, password, name];
}

class ForgotPasswordEvent extends AuthenticationEvent {
  const ForgotPasswordEvent({required this.email});

  final String email;

  @override
  List<String> get props => [email];
}

class UpdateUserEvent extends AuthenticationEvent {
  UpdateUserEvent({
    required this.action,
    required this.userData,
  }) : assert(
          userData is String || userData is File,
          '[userData] must be either a String or a File, but '
          'was ${userData.runtimeType}',
        );

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [action, userData];
}

class SignInWithGoogleEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailEvent extends AuthenticationEvent {
  const LoginWithEmailEvent({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  final String email;
  final String password;
  final bool rememberMe;

  @override
  List<String> get props => [email, password];
}

class RegisterWithEmailEvent extends AuthenticationEvent {
  const RegisterWithEmailEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<String> get props => [name, email, password];
}

// Cache Credentials
class CacheCredentialsEvent extends AuthenticationEvent {
  const CacheCredentialsEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

// Logout
class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

// Get Current User
class GetCurrentUserEvent extends AuthenticationEvent {
  const GetCurrentUserEvent();

  @override
  List<Object?> get props => [];
}
