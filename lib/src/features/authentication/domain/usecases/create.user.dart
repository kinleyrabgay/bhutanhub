// SRP
import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UsecaseWithParam<void, CreateUserParam> {
  const CreateUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture call(params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

// Custom type
class CreateUserParam extends Equatable {
  const CreateUserParam({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  // Empty constructor
  const CreateUserParam.empty()
      : this(
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.string',
        );

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
