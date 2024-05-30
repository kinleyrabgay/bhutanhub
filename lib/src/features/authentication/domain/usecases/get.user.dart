import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';

class GetUser extends UsecaseWithoutParam<User> {
  const GetUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<User> call() async => _repository.getUser();
}
