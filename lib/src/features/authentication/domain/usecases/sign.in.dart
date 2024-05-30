import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class Login extends UsecaseWithParam<void, LoginParams> {
  const Login(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<User> call(LoginParams params) => _repo.login(
        email: params.email,
        password: params.password,
      );
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  const LoginParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
